; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (30, 31) then Places a red 65x85 rectangle at position (46, 117) then Places a cyan dot at position (104, 50).
; PLAN: r0=30(x), r1=31(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=117(y), r7=65(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=50(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 31
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 117
LDI r7, 65
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 50
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
