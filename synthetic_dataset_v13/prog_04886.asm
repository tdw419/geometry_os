; DESCRIPTION: Renders a yellow line between points (295, 106) and (105, 173).
; PLAN: r0=295(x1), r1=106(y1), r2=105(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 106
LDI r2, 105
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
