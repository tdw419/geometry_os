; DESCRIPTION: Renders a cyan line between points (153, 1) and (180, 120).
; PLAN: r0=153(x1), r1=1(y1), r2=180(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 1
LDI r2, 180
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
