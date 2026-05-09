; DESCRIPTION: Renders a yellow line between points (123, 151) and (295, 176).
; PLAN: r0=123(x1), r1=151(y1), r2=295(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 151
LDI r2, 295
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
