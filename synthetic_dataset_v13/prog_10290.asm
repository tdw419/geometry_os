; DESCRIPTION: Composite: Draws a white rectangle at (19, 164) with width 74 and height 86 then Places a red line segment connecting (267, 96) to (242, 137).
; PLAN: r0=19(x), r1=164(y), r2=74(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x1), r6=96(y1), r7=242(x2), r8=137(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 164
LDI r2, 74
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 96
LDI r7, 242
LDI r8, 137
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
