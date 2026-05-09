; DESCRIPTION: Places a cyan line segment connecting (2, 165) to (350, 18).
; PLAN: r0=2(x1), r1=165(y1), r2=350(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 165
LDI r2, 350
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
