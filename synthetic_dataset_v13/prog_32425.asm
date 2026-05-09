; DESCRIPTION: Places a cyan line segment connecting (37, 21) to (160, 71).
; PLAN: r0=37(x1), r1=21(y1), r2=160(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 21
LDI r2, 160
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
