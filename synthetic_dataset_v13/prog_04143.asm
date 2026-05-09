; DESCRIPTION: Places a cyan line segment connecting (293, 191) to (236, 61).
; PLAN: r0=293(x1), r1=191(y1), r2=236(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 191
LDI r2, 236
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
