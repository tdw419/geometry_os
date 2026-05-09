; DESCRIPTION: Composite: Draws a cyan circle centered at (153, 107) with radius 74 then Renders a cyan line between points (294, 224) and (185, 169).
; PLAN: r0=153(x), r1=107(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=224(y1), r7=185(x2), r8=169(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 107
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 224
LDI r7, 185
LDI r8, 169
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
