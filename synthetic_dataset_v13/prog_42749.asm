; DESCRIPTION: Composite: Places a orange 31x32 rectangle at position (376, 93) then Renders a black line between points (269, 107) and (228, 231) then Places a yellow dot at position (315, 228).
; PLAN: r0=376(x), r1=93(y), r2=31(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x1), r6=107(y1), r7=228(x2), r8=231(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=228(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 93
LDI r2, 31
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 107
LDI r7, 228
LDI r8, 231
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 228
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
