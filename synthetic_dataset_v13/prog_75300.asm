; DESCRIPTION: Composite: Creates a white rectangular region at (122, 145) spanning 78 by 93 pixels then Places a cyan dot at position (277, 235) then Renders a red line between points (431, 80) and (198, 3).
; PLAN: r0=122(x), r1=145(y), r2=78(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=235(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=431(x1), r11=80(y1), r12=198(x2), r13=3(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 145
LDI r2, 78
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 235
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 80
LDI r12, 198
LDI r13, 3
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
