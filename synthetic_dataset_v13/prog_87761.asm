; DESCRIPTION: Composite: Creates a black circular shape at (156, 15) with radius 15 then Draws a cyan line from (352, 142) to (434, 229) then Places a cyan dot at position (19, 196).
; PLAN: r0=156(x), r1=15(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=142(y1), r7=434(x2), r8=229(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=196(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 15
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 142
LDI r7, 434
LDI r8, 229
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 196
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
