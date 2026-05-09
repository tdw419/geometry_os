; DESCRIPTION: Composite: Places a orange circle of radius 41 at center (401, 96) then Draws a cyan line from (295, 10) to (73, 115) then Places a white dot at position (349, 147).
; PLAN: r0=401(x), r1=96(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x1), r6=10(y1), r7=73(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=147(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 96
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 10
LDI r7, 73
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 147
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
