; DESCRIPTION: Composite: Renders a red box of size 104x90 starting at (213, 106) then Renders a blue disk with center (266, 52) and radius 15 then Sets a single red pixel at (307, 154).
; PLAN: r0=213(x), r1=106(y), r2=104(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=52(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=154(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 106
LDI r2, 104
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 52
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 154
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
