; DESCRIPTION: Composite: Creates a white rectangular region at (441, 21) spanning 30 by 40 pixels then Renders a green line between points (481, 117) and (193, 71) then Places a cyan dot at position (441, 197).
; PLAN: r0=441(x), r1=21(y), r2=30(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=117(y1), r7=193(x2), r8=71(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=197(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 21
LDI r2, 30
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 117
LDI r7, 193
LDI r8, 71
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 197
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
