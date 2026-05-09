; DESCRIPTION: Renders a magenta line between points (497, 238) and (352, 117).
; PLAN: r0=497(x1), r1=238(y1), r2=352(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 238
LDI r2, 352
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
