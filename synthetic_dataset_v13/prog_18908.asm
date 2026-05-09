; DESCRIPTION: Composite: Renders a cyan disk with center (90, 142) and radius 43 then Draws a yellow rectangle at (50, 73) with width 35 and height 67.
; PLAN: r0=90(x), r1=142(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=73(y), r7=35(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 142
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 73
LDI r7, 35
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
