; DESCRIPTION: Places a white line segment connecting (391, 229) to (255, 34).
; PLAN: r0=391(x1), r1=229(y1), r2=255(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 229
LDI r2, 255
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
