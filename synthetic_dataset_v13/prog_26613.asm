; DESCRIPTION: Composite: Places a green dot at position (485, 209) then Draws a cyan rectangle at (282, 29) with width 110 and height 12 then Places a cyan circle of radius 20 at center (479, 21).
; PLAN: r0=485(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=29(y), r7=110(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=21(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 485
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 282
LDI r6, 29
LDI r7, 110
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 21
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
