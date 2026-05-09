; DESCRIPTION: Renders a cyan line between points (180, 129) and (243, 62).
; PLAN: r0=180(x1), r1=129(y1), r2=243(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 129
LDI r2, 243
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
