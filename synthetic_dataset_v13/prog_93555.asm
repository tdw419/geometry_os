; DESCRIPTION: Places a magenta line segment connecting (2, 130) to (410, 19).
; PLAN: r0=2(x1), r1=130(y1), r2=410(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 130
LDI r2, 410
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
