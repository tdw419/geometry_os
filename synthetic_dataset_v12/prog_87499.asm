; DESCRIPTION: Composite: Renders a yellow box of size 47x91 starting at (50, 107) then Places a black circle of radius 70 at center (404, 118) then Places a blue dot at position (64, 223).
; PLAN: r0=50(x), r1=107(y), r2=47(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=118(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=223(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 107
LDI r2, 47
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 118
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 223
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
