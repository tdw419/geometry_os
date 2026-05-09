; DESCRIPTION: Composite: Draws a blue line from (329, 151) to (68, 81) then Renders a red disk with center (345, 101) and radius 42.
; PLAN: r0=329(x1), r1=151(y1), r2=68(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=101(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 151
LDI r2, 68
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 101
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
