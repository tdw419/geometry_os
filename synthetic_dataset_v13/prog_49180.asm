; DESCRIPTION: Renders a cyan line between points (450, 26) and (14, 59).
; PLAN: r0=450(x1), r1=26(y1), r2=14(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 26
LDI r2, 14
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
