; DESCRIPTION: Places a cyan line segment connecting (346, 49) to (4, 227).
; PLAN: r0=346(x1), r1=49(y1), r2=4(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 49
LDI r2, 4
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
