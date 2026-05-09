; DESCRIPTION: Places a white line segment connecting (275, 165) to (256, 244).
; PLAN: r0=275(x1), r1=165(y1), r2=256(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 165
LDI r2, 256
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
