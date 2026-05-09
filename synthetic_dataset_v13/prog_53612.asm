; DESCRIPTION: Places a cyan line segment connecting (232, 91) to (362, 225).
; PLAN: r0=232(x1), r1=91(y1), r2=362(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 91
LDI r2, 362
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
