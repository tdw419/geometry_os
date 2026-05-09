; DESCRIPTION: Composite: Places a cyan circle of radius 75 at center (418, 160) then Renders a blue box of size 65x52 starting at (422, 12) then Places a purple dot at position (263, 198).
; PLAN: r0=418(x), r1=160(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=12(y), r7=65(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=198(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 160
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 12
LDI r7, 65
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 198
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
