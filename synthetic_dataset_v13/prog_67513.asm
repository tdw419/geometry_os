; DESCRIPTION: Places a yellow line segment connecting (197, 129) to (422, 231).
; PLAN: r0=197(x1), r1=129(y1), r2=422(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 129
LDI r2, 422
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
