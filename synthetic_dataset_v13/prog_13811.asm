; DESCRIPTION: Places a orange line segment connecting (355, 42) to (502, 221).
; PLAN: r0=355(x1), r1=42(y1), r2=502(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 42
LDI r2, 502
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
