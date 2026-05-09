; DESCRIPTION: Composite: Places a cyan line segment connecting (387, 195) to (341, 160) then Draws a green rectangle at (280, 149) with width 10 and height 42.
; PLAN: r0=387(x1), r1=195(y1), r2=341(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=149(y), r7=10(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 195
LDI r2, 341
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 149
LDI r7, 10
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
