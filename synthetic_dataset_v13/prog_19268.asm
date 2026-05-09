; DESCRIPTION: Composite: Draws a cyan rectangle at (263, 92) with width 51 and height 82 then Draws a blue circle centered at (300, 46) with radius 16.
; PLAN: r0=263(x), r1=92(y), r2=51(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=46(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 92
LDI r2, 51
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 46
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
