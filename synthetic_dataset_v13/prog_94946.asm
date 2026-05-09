; DESCRIPTION: Composite: Places a cyan circle of radius 53 at center (414, 189) then Renders a magenta line between points (105, 239) and (43, 93) then Places a cyan dot at position (260, 48).
; PLAN: r0=414(x), r1=189(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=239(y1), r7=43(x2), r8=93(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=48(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 189
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 239
LDI r7, 43
LDI r8, 93
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 48
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
