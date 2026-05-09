; DESCRIPTION: Renders a magenta line between points (450, 249) and (460, 225).
; PLAN: r0=450(x1), r1=249(y1), r2=460(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 249
LDI r2, 460
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
