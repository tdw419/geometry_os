; DESCRIPTION: Composite: Creates a white rectangular region at (200, 164) spanning 87 by 53 pixels then Draws a cyan line from (31, 225) to (146, 61) then Places a cyan dot at position (363, 96).
; PLAN: r0=200(x), r1=164(y), r2=87(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=225(y1), r7=146(x2), r8=61(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=96(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 164
LDI r2, 87
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 225
LDI r7, 146
LDI r8, 61
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 96
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
