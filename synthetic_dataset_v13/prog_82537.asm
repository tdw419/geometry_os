; DESCRIPTION: Composite: Places a cyan 53x110 rectangle at position (192, 61) then Places a green dot at position (41, 98) then Draws a magenta circle centered at (363, 129) with radius 38.
; PLAN: r0=192(x), r1=61(y), r2=53(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=98(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=129(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 192
LDI r1, 61
LDI r2, 53
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 98
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 363
LDI r11, 129
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
