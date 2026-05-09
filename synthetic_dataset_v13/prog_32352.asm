; DESCRIPTION: Creates a black rectangular region at (276, 127) spanning 50 by 115 pixels.
; PLAN: r0=276(x), r1=127(y), r2=50(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 127
LDI r2, 50
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
