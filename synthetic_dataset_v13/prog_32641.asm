; DESCRIPTION: Composite: Draws a white rectangle at (257, 111) with width 71 and height 23 then Draws a purple line from (128, 55) to (404, 162) then Places a cyan dot at position (342, 124).
; PLAN: r0=257(x), r1=111(y), r2=71(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=55(y1), r7=404(x2), r8=162(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=124(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 111
LDI r2, 71
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 55
LDI r7, 404
LDI r8, 162
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 124
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
