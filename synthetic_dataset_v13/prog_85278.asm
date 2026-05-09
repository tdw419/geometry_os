; DESCRIPTION: Renders a cyan line between points (243, 225) and (52, 180).
; PLAN: r0=243(x1), r1=225(y1), r2=52(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 225
LDI r2, 52
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
