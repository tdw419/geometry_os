; DESCRIPTION: Composite: Draws a green rectangle at (215, 85) with width 87 and height 28 then Renders a cyan line between points (173, 46) and (28, 80).
; PLAN: r0=215(x), r1=85(y), r2=87(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=46(y1), r7=28(x2), r8=80(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 85
LDI r2, 87
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 46
LDI r7, 28
LDI r8, 80
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
