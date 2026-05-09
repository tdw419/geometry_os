; DESCRIPTION: Composite: Places a orange 93x103 rectangle at position (396, 128) then Places a cyan dot at position (243, 235) then Renders a magenta line between points (197, 103) and (129, 251).
; PLAN: r0=396(x), r1=128(y), r2=93(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=235(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=197(x1), r11=103(y1), r12=129(x2), r13=251(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 128
LDI r2, 93
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 235
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 197
LDI r11, 103
LDI r12, 129
LDI r13, 251
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
