; DESCRIPTION: Renders a magenta line between points (324, 59) and (187, 203).
; PLAN: r0=324(x1), r1=59(y1), r2=187(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 59
LDI r2, 187
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
