; DESCRIPTION: Places a cyan line segment connecting (272, 230) to (468, 197).
; PLAN: r0=272(x1), r1=230(y1), r2=468(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 230
LDI r2, 468
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
