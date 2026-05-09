; DESCRIPTION: Composite: Sets a single magenta pixel at (126, 207) then Places a purple 57x33 rectangle at position (269, 163) then Places a blue line segment connecting (257, 65) to (391, 167).
; PLAN: r0=126(x), r1=207(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=163(y), r7=57(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x1), r11=65(y1), r12=391(x2), r13=167(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 207
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 163
LDI r7, 57
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 65
LDI r12, 391
LDI r13, 167
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
