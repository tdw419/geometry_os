; DESCRIPTION: Composite: Places a red 41x91 rectangle at position (207, 162) then Renders a cyan line between points (328, 146) and (308, 218) then Sets a single purple pixel at (251, 141).
; PLAN: r0=207(x), r1=162(y), r2=41(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=146(y1), r7=308(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=141(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 162
LDI r2, 41
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 146
LDI r7, 308
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 141
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
