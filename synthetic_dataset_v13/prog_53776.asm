; DESCRIPTION: Places a cyan line segment connecting (264, 24) to (249, 90).
; PLAN: r0=264(x1), r1=24(y1), r2=249(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 24
LDI r2, 249
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
