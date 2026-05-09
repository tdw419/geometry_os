; DESCRIPTION: Renders a cyan line between points (161, 59) and (144, 17).
; PLAN: r0=161(x1), r1=59(y1), r2=144(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 59
LDI r2, 144
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
