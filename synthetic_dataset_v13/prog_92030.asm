; DESCRIPTION: Places a cyan line segment connecting (329, 77) to (183, 59).
; PLAN: r0=329(x1), r1=77(y1), r2=183(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 77
LDI r2, 183
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
