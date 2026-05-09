; DESCRIPTION: Renders a cyan line between points (98, 136) and (180, 243).
; PLAN: r0=98(x1), r1=136(y1), r2=180(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 136
LDI r2, 180
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
