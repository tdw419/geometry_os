; DESCRIPTION: Renders a magenta line between points (387, 157) and (352, 71).
; PLAN: r0=387(x1), r1=157(y1), r2=352(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 157
LDI r2, 352
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
