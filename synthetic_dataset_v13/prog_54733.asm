; DESCRIPTION: Composite: Draws a blue line from (12, 126) to (455, 103) then Renders a purple disk with center (282, 195) and radius 51 then Places a cyan 49x10 rectangle at position (462, 111).
; PLAN: r0=12(x1), r1=126(y1), r2=455(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=195(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x), r11=111(y), r12=49(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 126
LDI r2, 455
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 195
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 111
LDI r12, 49
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
