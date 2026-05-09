; DESCRIPTION: Composite: Renders a yellow line between points (424, 213) and (400, 176) then Places a cyan 82x93 rectangle at position (102, 79) then Sets a single red pixel at (398, 248).
; PLAN: r0=424(x1), r1=213(y1), r2=400(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=79(y), r7=82(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=248(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 213
LDI r2, 400
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 79
LDI r7, 82
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 248
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
