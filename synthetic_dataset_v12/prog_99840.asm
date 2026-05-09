; DESCRIPTION: Places a cyan line segment connecting (492, 191) to (372, 126).
; PLAN: r0=492(x1), r1=191(y1), r2=372(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 191
LDI r2, 372
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
