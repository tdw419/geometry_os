; DESCRIPTION: Composite: Places a green line segment connecting (224, 146) to (485, 98) then Draws a cyan rectangle at (123, 139) with width 32 and height 113.
; PLAN: r0=224(x1), r1=146(y1), r2=485(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=139(y), r7=32(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 146
LDI r2, 485
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 139
LDI r7, 32
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
