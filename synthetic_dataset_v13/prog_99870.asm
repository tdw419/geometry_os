; DESCRIPTION: Composite: Sets a single cyan pixel at (461, 132) then Creates a magenta circular shape at (327, 51) with radius 11 then Places a magenta 82x74 rectangle at position (404, 127).
; PLAN: r0=461(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=51(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=127(y), r12=82(width), r13=74(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 51
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 127
LDI r12, 82
LDI r13, 74
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
