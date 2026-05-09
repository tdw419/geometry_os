; DESCRIPTION: Composite: Renders a black disk with center (178, 202) and radius 40 then Places a magenta line segment connecting (168, 122) to (192, 57).
; PLAN: r0=178(x), r1=202(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x1), r6=122(y1), r7=192(x2), r8=57(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 202
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 122
LDI r7, 192
LDI r8, 57
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
