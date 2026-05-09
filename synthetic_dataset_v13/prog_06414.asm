; DESCRIPTION: Places a white line segment connecting (294, 209) to (22, 6).
; PLAN: r0=294(x1), r1=209(y1), r2=22(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 209
LDI r2, 22
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
