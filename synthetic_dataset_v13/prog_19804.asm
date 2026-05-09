; DESCRIPTION: Composite: Creates a purple rectangular region at (284, 89) spanning 32 by 55 pixels then Renders a purple line between points (321, 44) and (17, 221) then Places a cyan dot at position (18, 212).
; PLAN: r0=284(x), r1=89(y), r2=32(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=44(y1), r7=17(x2), r8=221(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=212(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 89
LDI r2, 32
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 44
LDI r7, 17
LDI r8, 221
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 212
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
