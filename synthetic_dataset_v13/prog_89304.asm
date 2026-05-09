; DESCRIPTION: Places a white line segment connecting (449, 215) to (272, 170).
; PLAN: r0=449(x1), r1=215(y1), r2=272(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 215
LDI r2, 272
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
