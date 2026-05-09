; DESCRIPTION: Composite: Places a yellow dot at position (66, 109) then Places a red 68x48 rectangle at position (27, 150) then Renders a white disk with center (274, 80) and radius 71.
; PLAN: r0=66(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=150(y), r7=68(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=80(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 27
LDI r6, 150
LDI r7, 68
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 80
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
