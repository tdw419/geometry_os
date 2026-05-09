; DESCRIPTION: Places a cyan line segment connecting (281, 240) to (474, 227).
; PLAN: r0=281(x1), r1=240(y1), r2=474(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 240
LDI r2, 474
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
