; DESCRIPTION: Composite: Renders a cyan box of size 116x83 starting at (79, 58) then Renders a red line between points (82, 113) and (504, 189) then Places a cyan dot at position (197, 28).
; PLAN: r0=79(x), r1=58(y), r2=116(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x1), r6=113(y1), r7=504(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=28(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 58
LDI r2, 116
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 113
LDI r7, 504
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 28
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
