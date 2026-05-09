; DESCRIPTION: Renders a yellow line between points (367, 103) and (437, 126).
; PLAN: r0=367(x1), r1=103(y1), r2=437(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 103
LDI r2, 437
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
