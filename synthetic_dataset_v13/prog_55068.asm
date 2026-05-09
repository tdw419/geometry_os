; DESCRIPTION: Composite: Draws a green line from (459, 7) to (358, 81) then Draws a red rectangle at (379, 66) with width 13 and height 27.
; PLAN: r0=459(x1), r1=7(y1), r2=358(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=66(y), r7=13(width), r8=27(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 7
LDI r2, 358
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 66
LDI r7, 13
LDI r8, 27
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
