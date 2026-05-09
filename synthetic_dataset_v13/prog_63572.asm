; DESCRIPTION: Composite: Sets a single purple pixel at (236, 193) then Places a magenta 39x103 rectangle at position (323, 82) then Creates a magenta circular shape at (15, 164) with radius 10.
; PLAN: r0=236(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=82(y), r7=39(width), r8=103(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x), r11=164(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 82
LDI r7, 39
LDI r8, 103
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 164
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
