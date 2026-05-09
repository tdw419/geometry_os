; DESCRIPTION: Renders a cyan line between points (369, 5) and (167, 65).
; PLAN: r0=369(x1), r1=5(y1), r2=167(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 5
LDI r2, 167
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
