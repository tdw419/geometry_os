; DESCRIPTION: Composite: Places a black circle of radius 46 at center (391, 138) then Draws a blue line from (479, 5) to (295, 137) then Places a cyan dot at position (210, 98).
; PLAN: r0=391(x), r1=138(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=5(y1), r7=295(x2), r8=137(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=98(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 138
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 5
LDI r7, 295
LDI r8, 137
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 98
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
