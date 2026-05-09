; DESCRIPTION: Places a cyan line segment connecting (278, 222) to (326, 39).
; PLAN: r0=278(x1), r1=222(y1), r2=326(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 222
LDI r2, 326
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
