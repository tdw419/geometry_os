; DESCRIPTION: Places a cyan line segment connecting (444, 36) to (249, 239).
; PLAN: r0=444(x1), r1=36(y1), r2=249(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 36
LDI r2, 249
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
