; DESCRIPTION: Composite: Draws a orange rectangle at (380, 83) with width 83 and height 98 then Draws a cyan line from (15, 83) to (404, 215) then Renders a orange disk with center (419, 170) and radius 58.
; PLAN: r0=380(x), r1=83(y), r2=83(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=83(y1), r7=404(x2), r8=215(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=170(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 83
LDI r2, 83
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 83
LDI r7, 404
LDI r8, 215
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 170
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
