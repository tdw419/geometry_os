; DESCRIPTION: Composite: Draws a yellow rectangle at (423, 142) with width 26 and height 76 then Places a green line segment connecting (76, 190) to (293, 35) then Places a cyan dot at position (434, 74).
; PLAN: r0=423(x), r1=142(y), r2=26(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=190(y1), r7=293(x2), r8=35(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=74(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 142
LDI r2, 26
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 190
LDI r7, 293
LDI r8, 35
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 74
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
