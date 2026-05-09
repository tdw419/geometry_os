; DESCRIPTION: Renders a yellow line between points (66, 186) and (485, 206).
; PLAN: r0=66(x1), r1=186(y1), r2=485(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 186
LDI r2, 485
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
