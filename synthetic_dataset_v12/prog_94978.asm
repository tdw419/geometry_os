; DESCRIPTION: Composite: Draws a black line from (298, 192) to (193, 127) then Places a black 95x102 rectangle at position (289, 99) then Sets a single red pixel at (386, 218).
; PLAN: r0=298(x1), r1=192(y1), r2=193(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=99(y), r7=95(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=218(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 192
LDI r2, 193
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 99
LDI r7, 95
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 218
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
