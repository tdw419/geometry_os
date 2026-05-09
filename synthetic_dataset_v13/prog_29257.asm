; DESCRIPTION: Composite: Renders a green line between points (488, 80) and (340, 92) then Draws a magenta rectangle at (134, 74) with width 22 and height 86 then Sets a single blue pixel at (294, 6).
; PLAN: r0=488(x1), r1=80(y1), r2=340(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=74(y), r7=22(width), r8=86(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=6(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 80
LDI r2, 340
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 74
LDI r7, 22
LDI r8, 86
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 6
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
