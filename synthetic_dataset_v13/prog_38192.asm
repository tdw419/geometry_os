; DESCRIPTION: Composite: Draws a white rectangle at (217, 130) with width 52 and height 10 then Renders a green line between points (342, 164) and (189, 28).
; PLAN: r0=217(x), r1=130(y), r2=52(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=164(y1), r7=189(x2), r8=28(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 130
LDI r2, 52
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 164
LDI r7, 189
LDI r8, 28
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
