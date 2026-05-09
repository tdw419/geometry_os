; DESCRIPTION: Places a cyan line segment connecting (482, 129) to (89, 199).
; PLAN: r0=482(x1), r1=129(y1), r2=89(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 129
LDI r2, 89
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
