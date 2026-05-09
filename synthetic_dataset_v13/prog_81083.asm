; DESCRIPTION: Composite: Draws a cyan rectangle at (61, 116) with width 112 and height 42 then Renders a green line between points (440, 176) and (274, 231) then Renders a cyan disk with center (437, 188) and radius 27.
; PLAN: r0=61(x), r1=116(y), r2=112(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x1), r6=176(y1), r7=274(x2), r8=231(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=188(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 116
LDI r2, 112
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 176
LDI r7, 274
LDI r8, 231
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 188
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
