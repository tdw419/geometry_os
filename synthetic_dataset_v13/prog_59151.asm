; DESCRIPTION: Composite: Places a yellow dot at position (482, 243) then Places a purple circle of radius 15 at center (59, 187) then Renders a cyan box of size 20x95 starting at (169, 103).
; PLAN: r0=482(x), r1=243(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=187(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=103(y), r12=20(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 243
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 187
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 103
LDI r12, 20
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
