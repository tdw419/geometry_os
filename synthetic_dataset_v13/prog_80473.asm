; DESCRIPTION: Renders a cyan line between points (106, 59) and (347, 150).
; PLAN: r0=106(x1), r1=59(y1), r2=347(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 59
LDI r2, 347
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
