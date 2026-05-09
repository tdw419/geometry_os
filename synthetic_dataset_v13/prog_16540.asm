; DESCRIPTION: Composite: Creates a cyan circular shape at (337, 179) with radius 65 then Draws a purple rectangle at (352, 25) with width 56 and height 67.
; PLAN: r0=337(x), r1=179(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=25(y), r7=56(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 179
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 25
LDI r7, 56
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
