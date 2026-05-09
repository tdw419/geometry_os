; DESCRIPTION: Composite: Places a magenta dot at position (67, 186) then Places a black 87x50 rectangle at position (88, 196) then Places a yellow circle of radius 19 at center (116, 215).
; PLAN: r0=67(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=196(y), r7=87(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=116(x), r11=215(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 196
LDI r7, 87
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 215
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
