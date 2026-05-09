; DESCRIPTION: Composite: Sets a single red pixel at (346, 159) then Draws a cyan line from (4, 17) to (474, 52) then Places a red 64x16 rectangle at position (390, 164).
; PLAN: r0=346(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=17(y1), r7=474(x2), r8=52(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=164(y), r12=64(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 4
LDI r6, 17
LDI r7, 474
LDI r8, 52
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 164
LDI r12, 64
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
