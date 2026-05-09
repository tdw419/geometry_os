; DESCRIPTION: Draws a purple line from (228, 131) to (153, 209).
; PLAN: r0=228(x1), r1=131(y1), r2=153(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 131
LDI r2, 153
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
