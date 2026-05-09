; DESCRIPTION: Composite: Draws a magenta rectangle at (72, 220) with width 47 and height 34 then Places a yellow line segment connecting (185, 42) to (75, 71).
; PLAN: r0=72(x), r1=220(y), r2=47(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=42(y1), r7=75(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 220
LDI r2, 47
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 42
LDI r7, 75
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
