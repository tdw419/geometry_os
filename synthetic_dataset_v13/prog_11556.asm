; DESCRIPTION: Renders a blue line between points (209, 43) and (16, 190).
; PLAN: r0=209(x1), r1=43(y1), r2=16(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 43
LDI r2, 16
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
