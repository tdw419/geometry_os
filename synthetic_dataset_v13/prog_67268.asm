; DESCRIPTION: Draws a red line from (59, 47) to (277, 65).
; PLAN: r0=59(x1), r1=47(y1), r2=277(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 47
LDI r2, 277
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
