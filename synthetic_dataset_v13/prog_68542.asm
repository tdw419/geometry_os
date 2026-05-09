; DESCRIPTION: Renders a white box of size 37x12 starting at (470, 121).
; PLAN: r0=470(x), r1=121(y), r2=37(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 121
LDI r2, 37
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
