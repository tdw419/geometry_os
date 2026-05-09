; DESCRIPTION: Places a white line segment connecting (281, 151) to (76, 21).
; PLAN: r0=281(x1), r1=151(y1), r2=76(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 151
LDI r2, 76
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
