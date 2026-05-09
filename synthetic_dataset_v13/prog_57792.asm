; DESCRIPTION: Creates a black rectangular region at (118, 63) spanning 98 by 120 pixels.
; PLAN: r0=118(x), r1=63(y), r2=98(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 63
LDI r2, 98
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
