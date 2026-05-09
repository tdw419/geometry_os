; DESCRIPTION: Composite: Places a red dot at position (460, 151) then Places a purple 109x35 rectangle at position (149, 53) then Places a cyan circle of radius 60 at center (204, 67).
; PLAN: r0=460(x), r1=151(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=53(y), r7=109(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x), r11=67(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 151
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 149
LDI r6, 53
LDI r7, 109
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 67
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
