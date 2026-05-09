; DESCRIPTION: Composite: Draws a purple rectangle at (384, 72) with width 61 and height 119 then Renders a green line between points (85, 58) and (168, 105) then Places a cyan dot at position (187, 191).
; PLAN: r0=384(x), r1=72(y), r2=61(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=58(y1), r7=168(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=191(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 72
LDI r2, 61
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 58
LDI r7, 168
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 191
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
