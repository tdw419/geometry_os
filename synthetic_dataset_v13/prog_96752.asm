; DESCRIPTION: Composite: Creates a orange circular shape at (422, 188) with radius 45 then Places a red dot at position (52, 64) then Places a magenta 98x81 rectangle at position (15, 38).
; PLAN: r0=422(x), r1=188(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=64(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=38(y), r12=98(width), r13=81(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 188
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 64
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 15
LDI r11, 38
LDI r12, 98
LDI r13, 81
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
