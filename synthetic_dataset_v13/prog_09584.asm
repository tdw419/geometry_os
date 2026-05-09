; DESCRIPTION: Composite: Places a green circle of radius 25 at center (336, 92) then Draws a red rectangle at (358, 38) with width 55 and height 97.
; PLAN: r0=336(x), r1=92(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=38(y), r7=55(width), r8=97(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 92
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 38
LDI r7, 55
LDI r8, 97
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
