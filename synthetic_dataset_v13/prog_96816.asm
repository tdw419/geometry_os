; DESCRIPTION: Draws a white line from (9, 130) to (192, 73).
; PLAN: r0=9(x1), r1=130(y1), r2=192(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 130
LDI r2, 192
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
