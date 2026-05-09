; DESCRIPTION: Draws a red line from (468, 234) to (337, 146).
; PLAN: r0=468(x1), r1=234(y1), r2=337(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 234
LDI r2, 337
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
