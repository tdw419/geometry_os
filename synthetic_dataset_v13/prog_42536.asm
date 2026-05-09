; DESCRIPTION: Composite: Renders a cyan box of size 46x97 starting at (404, 67) then Sets a single black pixel at (154, 23) then Draws a cyan circle centered at (90, 168) with radius 70.
; PLAN: r0=404(x), r1=67(y), r2=46(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=23(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=168(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 404
LDI r1, 67
LDI r2, 46
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 23
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 90
LDI r11, 168
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
