; DESCRIPTION: Composite: Renders a cyan box of size 105x47 starting at (360, 150) then Places a magenta dot at position (194, 168) then Draws a red circle centered at (492, 176) with radius 18.
; PLAN: r0=360(x), r1=150(y), r2=105(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=168(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=492(x), r11=176(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 150
LDI r2, 105
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 168
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 492
LDI r11, 176
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
