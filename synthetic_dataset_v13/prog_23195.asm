; DESCRIPTION: Composite: Renders a white disk with center (414, 149) and radius 74 then Places a magenta line segment connecting (394, 30) to (328, 29).
; PLAN: r0=414(x), r1=149(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=30(y1), r7=328(x2), r8=29(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 149
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 30
LDI r7, 328
LDI r8, 29
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
