; DESCRIPTION: Composite: Places a green dot at position (450, 244) then Draws a yellow rectangle at (423, 198) with width 21 and height 17.
; PLAN: r0=450(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=198(y), r7=21(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 450
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 198
LDI r7, 21
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
