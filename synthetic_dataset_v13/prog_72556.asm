; DESCRIPTION: Renders a white box of size 112x110 starting at (288, 12).
; PLAN: r0=288(x), r1=12(y), r2=112(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 12
LDI r2, 112
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
