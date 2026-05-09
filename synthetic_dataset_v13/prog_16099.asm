; DESCRIPTION: Places a cyan line segment connecting (310, 132) to (335, 189).
; PLAN: r0=310(x1), r1=132(y1), r2=335(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 132
LDI r2, 335
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
