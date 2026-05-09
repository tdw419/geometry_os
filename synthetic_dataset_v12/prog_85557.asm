; DESCRIPTION: Renders a cyan line between points (209, 106) and (219, 247).
; PLAN: r0=209(x1), r1=106(y1), r2=219(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 106
LDI r2, 219
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
