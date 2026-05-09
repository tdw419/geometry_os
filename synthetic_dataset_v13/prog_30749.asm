; DESCRIPTION: Renders a cyan line between points (65, 137) and (350, 46).
; PLAN: r0=65(x1), r1=137(y1), r2=350(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 137
LDI r2, 350
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
