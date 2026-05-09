; DESCRIPTION: Renders a magenta line between points (27, 102) and (352, 255).
; PLAN: r0=27(x1), r1=102(y1), r2=352(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 102
LDI r2, 352
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
