; DESCRIPTION: Renders a yellow line between points (480, 29) and (408, 139).
; PLAN: r0=480(x1), r1=29(y1), r2=408(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 29
LDI r2, 408
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
