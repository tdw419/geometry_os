; DESCRIPTION: Places a white line segment connecting (439, 205) to (240, 151).
; PLAN: r0=439(x1), r1=205(y1), r2=240(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 205
LDI r2, 240
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
