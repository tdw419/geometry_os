; DESCRIPTION: Composite: Places a green 91x102 rectangle at position (358, 0) then Draws a cyan circle centered at (216, 169) with radius 48.
; PLAN: r0=358(x), r1=0(y), r2=91(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=169(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 0
LDI r2, 91
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 169
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
