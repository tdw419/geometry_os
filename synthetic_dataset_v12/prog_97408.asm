; DESCRIPTION: Places a cyan line segment connecting (462, 22) to (329, 225).
; PLAN: r0=462(x1), r1=22(y1), r2=329(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 22
LDI r2, 329
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
