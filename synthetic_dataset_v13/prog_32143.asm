; DESCRIPTION: Renders a magenta line between points (276, 22) and (386, 40).
; PLAN: r0=276(x1), r1=22(y1), r2=386(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 22
LDI r2, 386
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
