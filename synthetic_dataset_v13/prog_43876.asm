; DESCRIPTION: Composite: Draws a red line from (121, 199) to (66, 209) then Draws a cyan rectangle at (224, 164) with width 20 and height 54.
; PLAN: r0=121(x1), r1=199(y1), r2=66(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=164(y), r7=20(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 199
LDI r2, 66
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 164
LDI r7, 20
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
