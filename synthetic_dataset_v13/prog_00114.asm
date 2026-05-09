; DESCRIPTION: Composite: Creates a white circular shape at (362, 101) with radius 61 then Renders a black line between points (299, 224) and (189, 129) then Places a magenta dot at position (13, 108).
; PLAN: r0=362(x), r1=101(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=224(y1), r7=189(x2), r8=129(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=108(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 101
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 224
LDI r7, 189
LDI r8, 129
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 108
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
