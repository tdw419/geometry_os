; DESCRIPTION: Places a cyan line segment connecting (55, 239) to (192, 217).
; PLAN: r0=55(x1), r1=239(y1), r2=192(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 239
LDI r2, 192
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
