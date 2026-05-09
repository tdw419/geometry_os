; DESCRIPTION: Renders a cyan line between points (369, 202) and (369, 209).
; PLAN: r0=369(x1), r1=202(y1), r2=369(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 202
LDI r2, 369
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
