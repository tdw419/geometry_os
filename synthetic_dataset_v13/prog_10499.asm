; DESCRIPTION: Draws a green line from (111, 129) to (431, 220).
; PLAN: r0=111(x1), r1=129(y1), r2=431(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 129
LDI r2, 431
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
