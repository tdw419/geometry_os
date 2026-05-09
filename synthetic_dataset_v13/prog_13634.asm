; DESCRIPTION: Renders a magenta line between points (387, 116) and (481, 91).
; PLAN: r0=387(x1), r1=116(y1), r2=481(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 116
LDI r2, 481
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
