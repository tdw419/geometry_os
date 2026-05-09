; DESCRIPTION: Places a cyan line segment connecting (94, 9) to (272, 225).
; PLAN: r0=94(x1), r1=9(y1), r2=272(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 9
LDI r2, 272
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
