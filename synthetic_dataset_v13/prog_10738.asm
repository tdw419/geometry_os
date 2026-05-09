; DESCRIPTION: Composite: Renders a green line between points (215, 4) and (443, 153) then Places a red circle of radius 24 at center (185, 42) then Sets a single purple pixel at (53, 225).
; PLAN: r0=215(x1), r1=4(y1), r2=443(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=42(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=225(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 4
LDI r2, 443
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 42
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 225
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
