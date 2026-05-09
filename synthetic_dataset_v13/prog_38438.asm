; DESCRIPTION: Places a green line segment connecting (475, 209) to (45, 19).
; PLAN: r0=475(x1), r1=209(y1), r2=45(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 209
LDI r2, 45
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
