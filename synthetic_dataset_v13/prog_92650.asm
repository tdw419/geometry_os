; DESCRIPTION: Composite: Places a blue dot at position (410, 58) then Draws a red rectangle at (306, 163) with width 107 and height 21 then Places a blue circle of radius 50 at center (226, 206).
; PLAN: r0=410(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=163(y), r7=107(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=206(y), r12=50(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 163
LDI r7, 107
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 206
LDI r12, 50
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
