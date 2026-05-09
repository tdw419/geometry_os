; DESCRIPTION: Renders a cyan line between points (406, 144) and (455, 237).
; PLAN: r0=406(x1), r1=144(y1), r2=455(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 144
LDI r2, 455
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
