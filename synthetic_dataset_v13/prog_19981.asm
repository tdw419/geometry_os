; DESCRIPTION: Renders a white box of size 37x91 starting at (288, 137).
; PLAN: r0=288(x), r1=137(y), r2=37(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 137
LDI r2, 37
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
