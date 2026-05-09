; DESCRIPTION: Composite: Draws a cyan circle centered at (307, 148) with radius 49 then Draws a white line from (21, 55) to (209, 130) then Places a magenta dot at position (239, 239).
; PLAN: r0=307(x), r1=148(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=55(y1), r7=209(x2), r8=130(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=239(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 148
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 55
LDI r7, 209
LDI r8, 130
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 239
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
