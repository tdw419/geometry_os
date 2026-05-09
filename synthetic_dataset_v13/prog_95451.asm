; DESCRIPTION: Composite: Draws a cyan rectangle at (307, 84) with width 32 and height 108 then Renders a orange line between points (410, 3) and (249, 70) then Sets a single red pixel at (479, 62).
; PLAN: r0=307(x), r1=84(y), r2=32(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=3(y1), r7=249(x2), r8=70(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=62(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 84
LDI r2, 32
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 3
LDI r7, 249
LDI r8, 70
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 62
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
