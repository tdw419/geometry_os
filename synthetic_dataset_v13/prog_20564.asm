; DESCRIPTION: Renders a green line between points (270, 129) and (383, 8).
; PLAN: r0=270(x1), r1=129(y1), r2=383(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 129
LDI r2, 383
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
