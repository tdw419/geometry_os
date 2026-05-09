; DESCRIPTION: Composite: Places a magenta circle of radius 26 at center (125, 229) then Draws a green rectangle at (94, 214) with width 21 and height 28 then Places a black dot at position (380, 124).
; PLAN: r0=125(x), r1=229(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=214(y), r7=21(width), r8=28(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=380(x), r11=124(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 125
LDI r1, 229
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 214
LDI r7, 21
LDI r8, 28
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 124
LDI r12, 0x000000
PSET r10, r11, r12
HALT
