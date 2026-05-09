; DESCRIPTION: Composite: Creates a cyan circular shape at (426, 67) with radius 55 then Places a red 53x55 rectangle at position (132, 93) then Draws a orange line from (92, 46) to (134, 242).
; PLAN: r0=426(x), r1=67(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=93(y), r7=53(width), r8=55(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x1), r11=46(y1), r12=134(x2), r13=242(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 67
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 93
LDI r7, 53
LDI r8, 55
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 46
LDI r12, 134
LDI r13, 242
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
