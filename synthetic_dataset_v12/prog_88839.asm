; DESCRIPTION: Renders a cyan line between points (21, 198) and (17, 243).
; PLAN: r0=21(x1), r1=198(y1), r2=17(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 198
LDI r2, 17
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
