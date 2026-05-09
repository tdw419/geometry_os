; DESCRIPTION: Places a white line segment connecting (360, 225) to (154, 168).
; PLAN: r0=360(x1), r1=225(y1), r2=154(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 225
LDI r2, 154
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
