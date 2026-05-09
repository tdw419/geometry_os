; DESCRIPTION: Renders a magenta line between points (146, 130) and (356, 68).
; PLAN: r0=146(x1), r1=130(y1), r2=356(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 130
LDI r2, 356
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
