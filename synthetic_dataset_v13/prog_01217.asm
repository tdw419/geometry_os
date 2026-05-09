; DESCRIPTION: Places a green line segment connecting (479, 96) to (293, 22).
; PLAN: r0=479(x1), r1=96(y1), r2=293(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 96
LDI r2, 293
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
