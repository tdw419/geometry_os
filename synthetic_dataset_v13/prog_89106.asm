; DESCRIPTION: Renders a yellow line between points (207, 8) and (126, 39).
; PLAN: r0=207(x1), r1=8(y1), r2=126(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 8
LDI r2, 126
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
