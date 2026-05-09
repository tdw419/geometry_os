; DESCRIPTION: Composite: Renders a red disk with center (355, 102) and radius 63 then Places a green line segment connecting (65, 27) to (167, 204).
; PLAN: r0=355(x), r1=102(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x1), r6=27(y1), r7=167(x2), r8=204(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 102
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 27
LDI r7, 167
LDI r8, 204
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
