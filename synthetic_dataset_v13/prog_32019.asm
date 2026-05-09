; DESCRIPTION: Composite: Draws a cyan line from (302, 53) to (488, 114) then Renders a white box of size 62x22 starting at (285, 114) then Sets a single cyan pixel at (87, 213).
; PLAN: r0=302(x1), r1=53(y1), r2=488(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=114(y), r7=62(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x), r11=213(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 302
LDI r1, 53
LDI r2, 488
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 114
LDI r7, 62
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 213
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
