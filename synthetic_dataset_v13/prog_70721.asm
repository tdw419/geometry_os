; DESCRIPTION: Renders a cyan line between points (371, 43) and (273, 180).
; PLAN: r0=371(x1), r1=43(y1), r2=273(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 43
LDI r2, 273
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
