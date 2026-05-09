; DESCRIPTION: Composite: Renders a black line between points (93, 76) and (267, 215) then Renders a red box of size 50x94 starting at (294, 0) then Draws a red circle centered at (415, 98) with radius 69.
; PLAN: r0=93(x1), r1=76(y1), r2=267(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=0(y), r7=50(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x), r11=98(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 76
LDI r2, 267
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 0
LDI r7, 50
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 98
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
