; DESCRIPTION: Composite: Creates a magenta circular shape at (329, 131) with radius 35 then Places a green line segment connecting (352, 125) to (402, 191) then Places a white 103x72 rectangle at position (219, 30).
; PLAN: r0=329(x), r1=131(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=125(y1), r7=402(x2), r8=191(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=30(y), r12=103(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 131
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 125
LDI r7, 402
LDI r8, 191
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 30
LDI r12, 103
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
