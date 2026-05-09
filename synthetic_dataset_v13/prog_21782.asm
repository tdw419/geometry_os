; DESCRIPTION: Composite: Creates a cyan circular shape at (361, 93) with radius 71 then Renders a orange line between points (484, 94) and (387, 179) then Places a yellow dot at position (298, 84).
; PLAN: r0=361(x), r1=93(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=94(y1), r7=387(x2), r8=179(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=84(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 93
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 94
LDI r7, 387
LDI r8, 179
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 84
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
