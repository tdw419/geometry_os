; DESCRIPTION: Places a white line segment connecting (94, 27) to (336, 197).
; PLAN: r0=94(x1), r1=27(y1), r2=336(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 27
LDI r2, 336
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
