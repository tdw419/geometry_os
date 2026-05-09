; DESCRIPTION: Composite: Places a yellow circle of radius 45 at center (396, 124) then Draws a magenta rectangle at (221, 182) with width 71 and height 37.
; PLAN: r0=396(x), r1=124(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=182(y), r7=71(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 124
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 182
LDI r7, 71
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
