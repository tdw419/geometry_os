; DESCRIPTION: Composite: Sets a single magenta pixel at (167, 38) then Places a yellow 67x70 rectangle at position (165, 68) then Renders a yellow disk with center (38, 32) and radius 16.
; PLAN: r0=167(x), r1=38(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=68(y), r7=67(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=32(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 38
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 68
LDI r7, 67
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 32
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
