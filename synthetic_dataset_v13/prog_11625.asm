; DESCRIPTION: Renders a green line between points (32, 160) and (303, 103).
; PLAN: r0=32(x1), r1=160(y1), r2=303(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 160
LDI r2, 303
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
