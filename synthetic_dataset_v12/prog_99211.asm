; DESCRIPTION: Composite: Places a cyan 86x58 rectangle at position (77, 178) then Places a yellow dot at position (488, 121) then Draws a white line from (417, 163) to (456, 61).
; PLAN: r0=77(x), r1=178(y), r2=86(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=121(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=417(x1), r11=163(y1), r12=456(x2), r13=61(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 178
LDI r2, 86
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 121
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 417
LDI r11, 163
LDI r12, 456
LDI r13, 61
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
