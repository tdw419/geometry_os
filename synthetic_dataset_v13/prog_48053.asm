; DESCRIPTION: Draws a green line from (418, 247) to (188, 57).
; PLAN: r0=418(x1), r1=247(y1), r2=188(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 247
LDI r2, 188
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
