; DESCRIPTION: Renders a white box of size 96x94 starting at (288, 98).
; PLAN: r0=288(x), r1=98(y), r2=96(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 98
LDI r2, 96
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
