; DESCRIPTION: Renders a yellow line between points (168, 129) and (408, 37).
; PLAN: r0=168(x1), r1=129(y1), r2=408(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 129
LDI r2, 408
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
