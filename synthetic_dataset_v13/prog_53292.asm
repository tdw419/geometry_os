; DESCRIPTION: Places a white line segment connecting (249, 128) to (372, 83).
; PLAN: r0=249(x1), r1=128(y1), r2=372(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 128
LDI r2, 372
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
