; DESCRIPTION: Places a white line segment connecting (146, 128) to (266, 220).
; PLAN: r0=146(x1), r1=128(y1), r2=266(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 128
LDI r2, 266
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
