; DESCRIPTION: Composite: Places a cyan 57x71 rectangle at position (45, 107) then Sets a single green pixel at (278, 133) then Draws a magenta line from (355, 93) to (422, 17).
; PLAN: r0=45(x), r1=107(y), r2=57(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=133(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=355(x1), r11=93(y1), r12=422(x2), r13=17(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 107
LDI r2, 57
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 133
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 355
LDI r11, 93
LDI r12, 422
LDI r13, 17
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
