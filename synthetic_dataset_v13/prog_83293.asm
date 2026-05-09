; DESCRIPTION: Composite: Creates a cyan circular shape at (436, 151) with radius 75 then Renders a black line between points (108, 27) and (440, 228) then Places a black dot at position (408, 94).
; PLAN: r0=436(x), r1=151(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=27(y1), r7=440(x2), r8=228(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=94(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 151
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 27
LDI r7, 440
LDI r8, 228
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 94
LDI r12, 0x000000
PSET r10, r11, r12
HALT
