; DESCRIPTION: Renders a cyan line between points (369, 146) and (455, 172).
; PLAN: r0=369(x1), r1=146(y1), r2=455(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 146
LDI r2, 455
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
