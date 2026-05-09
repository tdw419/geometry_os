; DESCRIPTION: Composite: Draws a orange rectangle at (72, 20) with width 82 and height 49 then Draws a cyan line from (286, 206) to (284, 159) then Places a blue dot at position (47, 49).
; PLAN: r0=72(x), r1=20(y), r2=82(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x1), r6=206(y1), r7=284(x2), r8=159(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=49(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 20
LDI r2, 82
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 206
LDI r7, 284
LDI r8, 159
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 49
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
