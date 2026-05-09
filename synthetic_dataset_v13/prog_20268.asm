; DESCRIPTION: Composite: Draws a red rectangle at (264, 80) with width 42 and height 72 then Renders a magenta line between points (370, 241) and (461, 238) then Places a yellow dot at position (504, 231).
; PLAN: r0=264(x), r1=80(y), r2=42(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=241(y1), r7=461(x2), r8=238(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=504(x), r11=231(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 80
LDI r2, 42
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 241
LDI r7, 461
LDI r8, 238
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 231
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
