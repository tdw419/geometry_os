; DESCRIPTION: Draws a red line from (122, 207) to (196, 243).
; PLAN: r0=122(x1), r1=207(y1), r2=196(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 207
LDI r2, 196
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
