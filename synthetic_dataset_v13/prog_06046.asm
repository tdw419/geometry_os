; DESCRIPTION: Renders a magenta line between points (460, 25) and (442, 3).
; PLAN: r0=460(x1), r1=25(y1), r2=442(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 25
LDI r2, 442
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
