; DESCRIPTION: Places a white line segment connecting (176, 206) to (15, 86).
; PLAN: r0=176(x1), r1=206(y1), r2=15(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 206
LDI r2, 15
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
