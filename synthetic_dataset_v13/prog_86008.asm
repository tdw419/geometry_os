; DESCRIPTION: Composite: Renders a cyan box of size 54x109 starting at (64, 142) then Draws a red circle centered at (123, 118) with radius 62.
; PLAN: r0=64(x), r1=142(y), r2=54(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=118(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 142
LDI r2, 54
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 118
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
