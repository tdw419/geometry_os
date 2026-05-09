; DESCRIPTION: Renders a magenta line between points (342, 130) and (59, 178).
; PLAN: r0=342(x1), r1=130(y1), r2=59(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 130
LDI r2, 59
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
