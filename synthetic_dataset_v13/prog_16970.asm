; DESCRIPTION: Composite: Sets a single green pixel at (374, 61) then Places a blue 26x50 rectangle at position (137, 205) then Places a red circle of radius 77 at center (339, 132).
; PLAN: r0=374(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=205(y), r7=26(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x), r11=132(y), r12=77(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 205
LDI r7, 26
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 132
LDI r12, 77
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
