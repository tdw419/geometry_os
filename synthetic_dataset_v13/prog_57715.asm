; DESCRIPTION: Composite: Renders a yellow box of size 96x15 starting at (78, 166) then Places a green line segment connecting (486, 38) to (267, 215) then Renders a cyan disk with center (213, 93) and radius 76.
; PLAN: r0=78(x), r1=166(y), r2=96(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=38(y1), r7=267(x2), r8=215(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=93(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 166
LDI r2, 96
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 38
LDI r7, 267
LDI r8, 215
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 93
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
