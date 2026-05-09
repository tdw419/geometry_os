; DESCRIPTION: Renders a cyan line between points (500, 222) and (1, 124).
; PLAN: r0=500(x1), r1=222(y1), r2=1(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 222
LDI r2, 1
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
