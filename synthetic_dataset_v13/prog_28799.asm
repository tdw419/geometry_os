; DESCRIPTION: Renders a green line between points (190, 180) and (179, 210).
; PLAN: r0=190(x1), r1=180(y1), r2=179(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 180
LDI r2, 179
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
