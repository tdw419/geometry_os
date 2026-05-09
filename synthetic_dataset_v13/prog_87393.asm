; DESCRIPTION: Composite: Renders a white box of size 112x26 starting at (215, 111) then Places a orange dot at position (373, 42) then Draws a cyan circle centered at (84, 124) with radius 39.
; PLAN: r0=215(x), r1=111(y), r2=112(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=42(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=124(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 111
LDI r2, 112
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 42
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 84
LDI r11, 124
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
