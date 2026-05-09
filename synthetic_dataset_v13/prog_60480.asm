; DESCRIPTION: Places a cyan line segment connecting (125, 162) to (331, 242).
; PLAN: r0=125(x1), r1=162(y1), r2=331(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 162
LDI r2, 331
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
