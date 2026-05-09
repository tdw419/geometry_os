; DESCRIPTION: Renders a yellow line between points (264, 202) and (295, 153).
; PLAN: r0=264(x1), r1=202(y1), r2=295(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 202
LDI r2, 295
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
