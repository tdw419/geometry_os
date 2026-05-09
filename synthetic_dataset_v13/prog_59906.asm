; DESCRIPTION: Draws a green line from (424, 229) to (255, 165).
; PLAN: r0=424(x1), r1=229(y1), r2=255(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 229
LDI r2, 255
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
