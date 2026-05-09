; DESCRIPTION: Composite: Renders a green line between points (435, 160) and (487, 39) then Draws a cyan rectangle at (102, 69) with width 91 and height 84 then Places a purple dot at position (89, 74).
; PLAN: r0=435(x1), r1=160(y1), r2=487(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=69(y), r7=91(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x), r11=74(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 160
LDI r2, 487
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 69
LDI r7, 91
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 74
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
