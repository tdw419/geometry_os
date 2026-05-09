; DESCRIPTION: Composite: Places a cyan dot at position (307, 151) then Draws a magenta rectangle at (403, 69) with width 73 and height 101 then Places a red circle of radius 45 at center (136, 171).
; PLAN: r0=307(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=69(y), r7=73(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=171(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 69
LDI r7, 73
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 171
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
