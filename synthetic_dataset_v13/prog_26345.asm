; DESCRIPTION: Composite: Places a blue dot at position (448, 190) then Renders a black box of size 60x58 starting at (50, 84) then Creates a cyan circular shape at (219, 151) with radius 51.
; PLAN: r0=448(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=84(y), r7=60(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=151(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 84
LDI r7, 60
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 151
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
