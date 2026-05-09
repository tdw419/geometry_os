; DESCRIPTION: Composite: Renders a magenta disk with center (197, 129) and radius 59 then Draws a purple rectangle at (373, 82) with width 102 and height 18.
; PLAN: r0=197(x), r1=129(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=82(y), r7=102(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 129
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 82
LDI r7, 102
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
