; DESCRIPTION: Composite: Places a red 62x120 rectangle at position (298, 96) then Draws a blue circle centered at (275, 48) with radius 45.
; PLAN: r0=298(x), r1=96(y), r2=62(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=48(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 96
LDI r2, 62
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 48
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
