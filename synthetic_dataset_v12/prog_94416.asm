; DESCRIPTION: Renders a white line between points (412, 150) and (46, 100).
; PLAN: r0=412(x1), r1=150(y1), r2=46(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 150
LDI r2, 46
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
