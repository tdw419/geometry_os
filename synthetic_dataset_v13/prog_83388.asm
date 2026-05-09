; DESCRIPTION: Composite: Places a magenta dot at position (12, 49) then Draws a blue rectangle at (30, 216) with width 60 and height 24 then Renders a yellow line between points (504, 121) and (509, 28).
; PLAN: r0=12(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=216(y), r7=60(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x1), r11=121(y1), r12=509(x2), r13=28(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 216
LDI r7, 60
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 121
LDI r12, 509
LDI r13, 28
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
