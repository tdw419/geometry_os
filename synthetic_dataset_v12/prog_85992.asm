; DESCRIPTION: Renders a yellow line between points (13, 247) and (328, 215).
; PLAN: r0=13(x1), r1=247(y1), r2=328(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 247
LDI r2, 328
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
