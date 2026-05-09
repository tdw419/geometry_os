; DESCRIPTION: Composite: Places a orange dot at position (417, 209) then Places a orange 111x70 rectangle at position (94, 1) then Places a black circle of radius 79 at center (228, 150).
; PLAN: r0=417(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=1(y), r7=111(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x), r11=150(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 94
LDI r6, 1
LDI r7, 111
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 150
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
