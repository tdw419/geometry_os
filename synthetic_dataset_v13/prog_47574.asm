; DESCRIPTION: Composite: Places a red circle of radius 40 at center (177, 202) then Renders a green line between points (413, 110) and (210, 188) then Sets a single magenta pixel at (54, 171).
; PLAN: r0=177(x), r1=202(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x1), r6=110(y1), r7=210(x2), r8=188(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=171(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 202
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 110
LDI r7, 210
LDI r8, 188
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 171
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
