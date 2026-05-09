; DESCRIPTION: Composite: Renders a green line between points (86, 106) and (254, 168) then Places a red dot at position (126, 240) then Creates a cyan circular shape at (415, 146) with radius 49.
; PLAN: r0=86(x1), r1=106(y1), r2=254(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=240(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=146(y), r12=49(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 106
LDI r2, 254
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 240
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 146
LDI r12, 49
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
