; DESCRIPTION: Composite: Places a cyan dot at position (259, 228) then Places a purple 78x37 rectangle at position (417, 137) then Renders a magenta disk with center (288, 78) and radius 70.
; PLAN: r0=259(x), r1=228(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=137(y), r7=78(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=78(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 228
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 137
LDI r7, 78
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 78
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
