; DESCRIPTION: Composite: Sets a single blue pixel at (480, 244) then Renders a purple box of size 104x108 starting at (282, 117) then Places a magenta line segment connecting (154, 61) to (387, 19).
; PLAN: r0=480(x), r1=244(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=117(y), r7=104(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=61(y1), r12=387(x2), r13=19(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 244
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 117
LDI r7, 104
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 61
LDI r12, 387
LDI r13, 19
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
