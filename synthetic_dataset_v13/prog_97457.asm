; DESCRIPTION: Places a red line segment connecting (367, 220) to (253, 186).
; PLAN: r0=367(x1), r1=220(y1), r2=253(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 220
LDI r2, 253
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
