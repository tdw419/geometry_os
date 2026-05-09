; DESCRIPTION: Composite: Renders a cyan line between points (270, 24) and (101, 182) then Draws a magenta rectangle at (363, 32) with width 85 and height 108 then Creates a cyan circular shape at (284, 221) with radius 26.
; PLAN: r0=270(x1), r1=24(y1), r2=101(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=32(y), r7=85(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=221(y), r12=26(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 24
LDI r2, 101
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 32
LDI r7, 85
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 221
LDI r12, 26
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
