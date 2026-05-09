; DESCRIPTION: Places a red line segment connecting (154, 253) to (450, 176).
; PLAN: r0=154(x1), r1=253(y1), r2=450(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 253
LDI r2, 450
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
