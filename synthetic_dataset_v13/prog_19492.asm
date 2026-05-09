; DESCRIPTION: Renders a green line between points (182, 18) and (25, 160).
; PLAN: r0=182(x1), r1=18(y1), r2=25(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 18
LDI r2, 25
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
