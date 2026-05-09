; DESCRIPTION: Draws a yellow line from (160, 214) to (335, 146).
; PLAN: r0=160(x1), r1=214(y1), r2=335(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 214
LDI r2, 335
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
