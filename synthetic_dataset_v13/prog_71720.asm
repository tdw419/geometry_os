; DESCRIPTION: Renders a yellow line between points (25, 27) and (264, 214).
; PLAN: r0=25(x1), r1=27(y1), r2=264(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 27
LDI r2, 264
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
