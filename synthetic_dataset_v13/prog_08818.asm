; DESCRIPTION: Composite: Sets a single green pixel at (264, 227) then Places a cyan 120x110 rectangle at position (10, 99) then Places a red circle of radius 47 at center (64, 137).
; PLAN: r0=264(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=99(y), r7=120(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x), r11=137(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 10
LDI r6, 99
LDI r7, 120
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 137
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
