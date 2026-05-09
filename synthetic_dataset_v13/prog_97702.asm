; DESCRIPTION: Composite: Draws a cyan line from (293, 98) to (319, 173) then Draws a magenta rectangle at (224, 94) with width 15 and height 19.
; PLAN: r0=293(x1), r1=98(y1), r2=319(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=94(y), r7=15(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 98
LDI r2, 319
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 94
LDI r7, 15
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
