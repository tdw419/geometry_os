; DESCRIPTION: Composite: Sets a single magenta pixel at (220, 179) then Places a cyan 59x36 rectangle at position (146, 21) then Draws a blue circle centered at (176, 54) with radius 48.
; PLAN: r0=220(x), r1=179(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=21(y), r7=59(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=54(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 179
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 21
LDI r7, 59
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 54
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
