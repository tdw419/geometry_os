; DESCRIPTION: Places a white line segment connecting (130, 175) to (256, 173).
; PLAN: r0=130(x1), r1=175(y1), r2=256(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 175
LDI r2, 256
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
