; DESCRIPTION: Composite: Renders a green disk with center (290, 184) and radius 61 then Draws a white line from (93, 215) to (239, 99).
; PLAN: r0=290(x), r1=184(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x1), r6=215(y1), r7=239(x2), r8=99(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 184
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 215
LDI r7, 239
LDI r8, 99
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
