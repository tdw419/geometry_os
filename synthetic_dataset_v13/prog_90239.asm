; DESCRIPTION: Composite: Creates a green circular shape at (61, 128) with radius 41 then Draws a cyan line from (294, 190) to (505, 55) then Places a cyan dot at position (281, 34).
; PLAN: r0=61(x), r1=128(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=190(y1), r7=505(x2), r8=55(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=34(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 128
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 190
LDI r7, 505
LDI r8, 55
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 34
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
