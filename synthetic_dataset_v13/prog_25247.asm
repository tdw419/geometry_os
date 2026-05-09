; DESCRIPTION: Places a cyan line segment connecting (270, 222) to (317, 91).
; PLAN: r0=270(x1), r1=222(y1), r2=317(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 222
LDI r2, 317
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
