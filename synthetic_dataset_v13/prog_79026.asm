; DESCRIPTION: Renders a blue line between points (228, 151) and (338, 207).
; PLAN: r0=228(x1), r1=151(y1), r2=338(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 151
LDI r2, 338
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
