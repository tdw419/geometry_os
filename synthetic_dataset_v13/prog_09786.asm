; DESCRIPTION: Draws a yellow line from (352, 169) to (59, 171).
; PLAN: r0=352(x1), r1=169(y1), r2=59(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 169
LDI r2, 59
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
