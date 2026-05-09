; DESCRIPTION: Composite: Draws a blue circle centered at (195, 164) with radius 66 then Renders a cyan box of size 65x78 starting at (187, 4) then Places a cyan dot at position (259, 210).
; PLAN: r0=195(x), r1=164(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=4(y), r7=65(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=210(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 164
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 4
LDI r7, 65
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 210
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
