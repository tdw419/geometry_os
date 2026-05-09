; DESCRIPTION: Composite: Draws a green circle centered at (236, 105) with radius 67 then Renders a cyan box of size 25x53 starting at (252, 79) then Places a red dot at position (349, 57).
; PLAN: r0=236(x), r1=105(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=79(y), r7=25(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=349(x), r11=57(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 105
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 79
LDI r7, 25
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 57
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
