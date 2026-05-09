; DESCRIPTION: Composite: Places a magenta dot at position (393, 53) then Renders a yellow box of size 13x21 starting at (3, 56) then Places a green line segment connecting (64, 103) to (211, 198).
; PLAN: r0=393(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=56(y), r7=13(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x1), r11=103(y1), r12=211(x2), r13=198(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 56
LDI r7, 13
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 103
LDI r12, 211
LDI r13, 198
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
