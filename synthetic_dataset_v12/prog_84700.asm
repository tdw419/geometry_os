; DESCRIPTION: Composite: Draws a magenta rectangle at (152, 95) with width 71 and height 64 then Renders a blue line between points (405, 130) and (42, 52).
; PLAN: r0=152(x), r1=95(y), r2=71(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=130(y1), r7=42(x2), r8=52(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 95
LDI r2, 71
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 130
LDI r7, 42
LDI r8, 52
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
