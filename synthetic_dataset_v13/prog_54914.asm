; DESCRIPTION: Renders a white box of size 80x112 starting at (393, 54).
; PLAN: r0=393(x), r1=54(y), r2=80(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 54
LDI r2, 80
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
