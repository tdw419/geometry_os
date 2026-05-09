; DESCRIPTION: Composite: Sets a single purple pixel at (418, 16) then Draws a cyan circle centered at (427, 111) with radius 30 then Places a blue 21x77 rectangle at position (305, 150).
; PLAN: r0=418(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=111(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=150(y), r12=21(width), r13=77(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 111
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 150
LDI r12, 21
LDI r13, 77
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
