; DESCRIPTION: Places a magenta line segment connecting (453, 146) to (460, 203).
; PLAN: r0=453(x1), r1=146(y1), r2=460(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 146
LDI r2, 460
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
