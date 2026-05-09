; DESCRIPTION: Places a green line segment connecting (211, 253) to (146, 253).
; PLAN: r0=211(x1), r1=253(y1), r2=146(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 253
LDI r2, 146
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
