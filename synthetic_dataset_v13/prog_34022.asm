; DESCRIPTION: Composite: Draws a purple rectangle at (296, 220) with width 46 and height 12 then Places a green dot at position (456, 99).
; PLAN: r0=296(x), r1=220(y), r2=46(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=99(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 220
LDI r2, 46
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 99
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
