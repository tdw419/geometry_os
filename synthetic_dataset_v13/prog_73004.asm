; DESCRIPTION: Renders a magenta line between points (400, 130) and (333, 215).
; PLAN: r0=400(x1), r1=130(y1), r2=333(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 130
LDI r2, 333
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
