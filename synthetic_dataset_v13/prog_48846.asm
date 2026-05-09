; DESCRIPTION: Composite: Places a blue line segment connecting (302, 65) to (405, 213) then Draws a green rectangle at (202, 68) with width 51 and height 47 then Places a cyan dot at position (32, 194).
; PLAN: r0=302(x1), r1=65(y1), r2=405(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=68(y), r7=51(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=194(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 65
LDI r2, 405
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 68
LDI r7, 51
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 194
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
