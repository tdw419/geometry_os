; DESCRIPTION: Renders a purple line between points (401, 166) and (352, 247).
; PLAN: r0=401(x1), r1=166(y1), r2=352(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 166
LDI r2, 352
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
