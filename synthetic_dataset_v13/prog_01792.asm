; DESCRIPTION: Renders a red line between points (440, 211) and (291, 46).
; PLAN: r0=440(x1), r1=211(y1), r2=291(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 211
LDI r2, 291
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
