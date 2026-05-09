; DESCRIPTION: Composite: Draws a magenta circle centered at (307, 180) with radius 42 then Places a yellow dot at position (492, 41) then Creates a red rectangular region at (80, 13) spanning 103 by 98 pixels.
; PLAN: r0=307(x), r1=180(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=41(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=13(y), r12=103(width), r13=98(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 180
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 41
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 80
LDI r11, 13
LDI r12, 103
LDI r13, 98
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
