; DESCRIPTION: Composite: Renders a cyan line between points (179, 48) and (289, 70) then Draws a magenta rectangle at (264, 155) with width 76 and height 19.
; PLAN: r0=179(x1), r1=48(y1), r2=289(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=155(y), r7=76(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 48
LDI r2, 289
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 155
LDI r7, 76
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
