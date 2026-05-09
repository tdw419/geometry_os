; DESCRIPTION: Composite: Places a magenta circle of radius 62 at center (365, 139) then Renders a yellow line between points (338, 164) and (220, 168) then Places a black dot at position (182, 246).
; PLAN: r0=365(x), r1=139(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=164(y1), r7=220(x2), r8=168(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=246(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 139
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 164
LDI r7, 220
LDI r8, 168
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 246
LDI r12, 0x000000
PSET r10, r11, r12
HALT
