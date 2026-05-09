; DESCRIPTION: Composite: Places a green circle of radius 64 at center (284, 64) then Draws a purple line from (485, 16) to (171, 94) then Places a cyan 90x36 rectangle at position (390, 27).
; PLAN: r0=284(x), r1=64(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x1), r6=16(y1), r7=171(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=27(y), r12=90(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 64
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 16
LDI r7, 171
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 27
LDI r12, 90
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
