; DESCRIPTION: Composite: Draws a cyan circle centered at (256, 155) with radius 28 then Places a red dot at position (445, 161) then Renders a black box of size 44x81 starting at (69, 168).
; PLAN: r0=256(x), r1=155(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=161(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=168(y), r12=44(width), r13=81(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 155
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 161
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 69
LDI r11, 168
LDI r12, 44
LDI r13, 81
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
