; DESCRIPTION: Renders a cyan line between points (269, 59) and (52, 65).
; PLAN: r0=269(x1), r1=59(y1), r2=52(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 59
LDI r2, 52
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
