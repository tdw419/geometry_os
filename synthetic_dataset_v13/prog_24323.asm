; DESCRIPTION: Composite: Draws a red rectangle at (102, 9) with width 105 and height 113 then Draws a green line from (361, 30) to (504, 103).
; PLAN: r0=102(x), r1=9(y), r2=105(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x1), r6=30(y1), r7=504(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 9
LDI r2, 105
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 30
LDI r7, 504
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
