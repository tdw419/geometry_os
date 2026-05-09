; DESCRIPTION: Composite: Creates a orange circular shape at (303, 59) with radius 53 then Renders a cyan line between points (27, 241) and (109, 184) then Renders a purple box of size 82x81 starting at (291, 3).
; PLAN: r0=303(x), r1=59(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=241(y1), r7=109(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=3(y), r12=82(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 59
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 241
LDI r7, 109
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 3
LDI r12, 82
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
