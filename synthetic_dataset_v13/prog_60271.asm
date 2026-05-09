; DESCRIPTION: Creates a black rectangular region at (281, 127) spanning 85 by 39 pixels.
; PLAN: r0=281(x), r1=127(y), r2=85(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 127
LDI r2, 85
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
