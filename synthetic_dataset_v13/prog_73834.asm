; DESCRIPTION: Renders a green line between points (328, 50) and (373, 16).
; PLAN: r0=328(x1), r1=50(y1), r2=373(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 50
LDI r2, 373
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
