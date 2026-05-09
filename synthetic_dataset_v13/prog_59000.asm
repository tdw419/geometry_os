; DESCRIPTION: Composite: Sets a single orange pixel at (352, 112) then Draws a orange rectangle at (449, 95) with width 52 and height 86 then Places a red circle of radius 72 at center (240, 165).
; PLAN: r0=352(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=95(y), r7=52(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x), r11=165(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 449
LDI r6, 95
LDI r7, 52
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 165
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
