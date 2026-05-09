; DESCRIPTION: Places a white line segment connecting (502, 220) to (192, 96).
; PLAN: r0=502(x1), r1=220(y1), r2=192(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 220
LDI r2, 192
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
