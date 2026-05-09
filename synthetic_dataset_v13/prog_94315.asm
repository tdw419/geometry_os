; DESCRIPTION: Composite: Places a purple dot at position (307, 141) then Places a magenta circle of radius 36 at center (136, 44) then Places a purple 30x14 rectangle at position (51, 161).
; PLAN: r0=307(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=44(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=51(x), r11=161(y), r12=30(width), r13=14(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 44
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 51
LDI r11, 161
LDI r12, 30
LDI r13, 14
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
