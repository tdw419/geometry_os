; DESCRIPTION: Draws a red line from (264, 247) to (234, 146).
; PLAN: r0=264(x1), r1=247(y1), r2=234(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 247
LDI r2, 234
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
