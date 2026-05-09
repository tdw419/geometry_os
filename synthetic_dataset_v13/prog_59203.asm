; DESCRIPTION: Composite: Places a red dot at position (434, 26) then Draws a purple rectangle at (160, 102) with width 49 and height 107 then Places a red line segment connecting (42, 52) to (280, 213).
; PLAN: r0=434(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=102(y), r7=49(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x1), r11=52(y1), r12=280(x2), r13=213(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 160
LDI r6, 102
LDI r7, 49
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 52
LDI r12, 280
LDI r13, 213
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
