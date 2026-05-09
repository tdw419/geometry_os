; DESCRIPTION: Composite: Renders a black box of size 56x67 starting at (308, 106) then Places a magenta dot at position (60, 228) then Draws a black circle centered at (406, 120) with radius 10.
; PLAN: r0=308(x), r1=106(y), r2=56(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=406(x), r11=120(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 106
LDI r2, 56
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 406
LDI r11, 120
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
