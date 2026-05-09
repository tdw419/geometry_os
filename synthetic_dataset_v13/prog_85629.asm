; DESCRIPTION: Composite: Draws a magenta circle centered at (256, 117) with radius 44 then Renders a green box of size 38x99 starting at (177, 79).
; PLAN: r0=256(x), r1=117(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=79(y), r7=38(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 117
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 79
LDI r7, 38
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
