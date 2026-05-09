; DESCRIPTION: Places a white line segment connecting (143, 68) to (214, 242).
; PLAN: r0=143(x1), r1=68(y1), r2=214(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 68
LDI r2, 214
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
