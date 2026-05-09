; DESCRIPTION: Places a cyan line segment connecting (391, 207) to (94, 21).
; PLAN: r0=391(x1), r1=207(y1), r2=94(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 207
LDI r2, 94
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
