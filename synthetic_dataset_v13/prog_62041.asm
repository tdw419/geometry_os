; DESCRIPTION: Composite: Places a cyan line segment connecting (361, 161) to (370, 126) then Draws a white rectangle at (191, 63) with width 63 and height 106.
; PLAN: r0=361(x1), r1=161(y1), r2=370(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=63(y), r7=63(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 161
LDI r2, 370
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 63
LDI r7, 63
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
