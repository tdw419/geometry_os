; DESCRIPTION: Draws a orange line from (273, 197) to (116, 243).
; PLAN: r0=273(x1), r1=197(y1), r2=116(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 197
LDI r2, 116
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
