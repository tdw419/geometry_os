; DESCRIPTION: Renders a green line between points (168, 26) and (240, 192).
; PLAN: r0=168(x1), r1=26(y1), r2=240(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 26
LDI r2, 240
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
