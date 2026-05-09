; DESCRIPTION: Composite: Creates a magenta circular shape at (429, 103) with radius 38 then Places a black dot at position (177, 8) then Renders a magenta box of size 11x13 starting at (199, 3).
; PLAN: r0=429(x), r1=103(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=8(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=3(y), r12=11(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 103
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 8
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 199
LDI r11, 3
LDI r12, 11
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
