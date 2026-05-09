; DESCRIPTION: Composite: Creates a yellow circular shape at (246, 132) with radius 64 then Renders a white line between points (352, 92) and (108, 59) then Places a blue 106x11 rectangle at position (87, 139).
; PLAN: r0=246(x), r1=132(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=92(y1), r7=108(x2), r8=59(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=139(y), r12=106(width), r13=11(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 132
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 92
LDI r7, 108
LDI r8, 59
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 139
LDI r12, 106
LDI r13, 11
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
