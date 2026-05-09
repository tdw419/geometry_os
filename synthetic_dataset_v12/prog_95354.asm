; DESCRIPTION: Places a white line segment connecting (263, 120) to (336, 208).
; PLAN: r0=263(x1), r1=120(y1), r2=336(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 120
LDI r2, 336
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
