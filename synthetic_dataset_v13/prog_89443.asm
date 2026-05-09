; DESCRIPTION: Composite: Creates a green circular shape at (243, 90) with radius 76 then Draws a red rectangle at (61, 111) with width 111 and height 21.
; PLAN: r0=243(x), r1=90(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=111(y), r7=111(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 90
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 111
LDI r7, 111
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
