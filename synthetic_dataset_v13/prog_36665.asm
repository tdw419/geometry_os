; DESCRIPTION: Composite: Draws a yellow circle centered at (105, 127) with radius 35 then Places a green 84x47 rectangle at position (183, 168) then Places a blue dot at position (161, 57).
; PLAN: r0=105(x), r1=127(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=168(y), r7=84(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x), r11=57(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 127
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 168
LDI r7, 84
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 57
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
