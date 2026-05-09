; DESCRIPTION: Composite: Creates a red rectangular region at (290, 75) spanning 120 by 46 pixels then Renders a cyan line between points (322, 198) and (324, 107) then Places a red dot at position (193, 237).
; PLAN: r0=290(x), r1=75(y), r2=120(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=198(y1), r7=324(x2), r8=107(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=237(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 75
LDI r2, 120
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 198
LDI r7, 324
LDI r8, 107
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 237
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
