; DESCRIPTION: Renders a cyan line between points (472, 127) and (248, 55).
; PLAN: r0=472(x1), r1=127(y1), r2=248(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 127
LDI r2, 248
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
