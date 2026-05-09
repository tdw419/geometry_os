; DESCRIPTION: Composite: Places a black circle of radius 40 at center (80, 129) then Draws a cyan rectangle at (207, 102) with width 114 and height 61 then Sets a single white pixel at (271, 2).
; PLAN: r0=80(x), r1=129(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=102(y), r7=114(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x), r11=2(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 129
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 102
LDI r7, 114
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 2
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
