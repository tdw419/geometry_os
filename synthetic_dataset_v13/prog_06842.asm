; DESCRIPTION: Draws a white line from (42, 130) to (211, 0).
; PLAN: r0=42(x1), r1=130(y1), r2=211(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 130
LDI r2, 211
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
