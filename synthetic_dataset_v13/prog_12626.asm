; DESCRIPTION: Composite: Renders a cyan box of size 44x52 starting at (310, 168) then Places a blue dot at position (362, 221) then Renders a purple line between points (396, 191) and (257, 40).
; PLAN: r0=310(x), r1=168(y), r2=44(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=191(y1), r12=257(x2), r13=40(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 168
LDI r2, 44
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 191
LDI r12, 257
LDI r13, 40
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
