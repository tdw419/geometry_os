; DESCRIPTION: Composite: Places a green dot at position (324, 48) then Draws a black rectangle at (401, 139) with width 29 and height 90 then Renders a red disk with center (412, 125) and radius 68.
; PLAN: r0=324(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=139(y), r7=29(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=125(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 401
LDI r6, 139
LDI r7, 29
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 125
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
