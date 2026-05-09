; DESCRIPTION: Draws a green line from (178, 229) to (49, 174).
; PLAN: r0=178(x1), r1=229(y1), r2=49(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 229
LDI r2, 49
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
