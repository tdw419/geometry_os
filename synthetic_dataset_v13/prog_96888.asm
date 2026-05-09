; DESCRIPTION: Renders a cyan line between points (86, 226) and (455, 243).
; PLAN: r0=86(x1), r1=226(y1), r2=455(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 226
LDI r2, 455
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
