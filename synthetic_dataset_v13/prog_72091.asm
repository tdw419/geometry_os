; DESCRIPTION: Composite: Places a orange circle of radius 54 at center (418, 72) then Places a red 111x112 rectangle at position (225, 2) then Places a red dot at position (494, 231).
; PLAN: r0=418(x), r1=72(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=2(y), r7=111(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x), r11=231(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 72
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 2
LDI r7, 111
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 231
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
