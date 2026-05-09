; DESCRIPTION: Places a cyan line segment connecting (271, 16) to (172, 232).
; PLAN: r0=271(x1), r1=16(y1), r2=172(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 16
LDI r2, 172
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
