; DESCRIPTION: Places a green line segment connecting (324, 175) to (502, 223).
; PLAN: r0=324(x1), r1=175(y1), r2=502(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 175
LDI r2, 502
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
