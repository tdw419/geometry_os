; DESCRIPTION: Places a red line segment connecting (265, 253) to (168, 148).
; PLAN: r0=265(x1), r1=253(y1), r2=168(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 253
LDI r2, 168
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
