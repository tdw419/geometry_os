; DESCRIPTION: Draws a red line from (424, 180) to (455, 221).
; PLAN: r0=424(x1), r1=180(y1), r2=455(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 180
LDI r2, 455
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
