; DESCRIPTION: Composite: Creates a red circular shape at (307, 111) with radius 69 then Draws a orange rectangle at (270, 82) with width 10 and height 30 then Places a cyan dot at position (91, 72).
; PLAN: r0=307(x), r1=111(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=82(y), r7=10(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=72(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 111
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 82
LDI r7, 10
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 72
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
