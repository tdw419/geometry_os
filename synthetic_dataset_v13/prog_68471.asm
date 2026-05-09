; DESCRIPTION: Composite: Draws a blue rectangle at (388, 129) with width 120 and height 51 then Draws a white circle centered at (391, 176) with radius 80.
; PLAN: r0=388(x), r1=129(y), r2=120(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=176(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 129
LDI r2, 120
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 176
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
