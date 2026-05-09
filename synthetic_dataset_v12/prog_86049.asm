; DESCRIPTION: Composite: Renders a cyan line between points (295, 102) and (112, 173) then Draws a yellow rectangle at (71, 70) with width 90 and height 120 then Places a purple dot at position (258, 93).
; PLAN: r0=295(x1), r1=102(y1), r2=112(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=70(y), r7=90(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=93(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 102
LDI r2, 112
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 70
LDI r7, 90
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 93
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
