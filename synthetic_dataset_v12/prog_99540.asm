; DESCRIPTION: Composite: Draws a white rectangle at (471, 66) with width 24 and height 86 then Places a cyan dot at position (388, 47) then Renders a green line between points (279, 237) and (116, 170).
; PLAN: r0=471(x), r1=66(y), r2=24(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=47(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=279(x1), r11=237(y1), r12=116(x2), r13=170(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 66
LDI r2, 24
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 47
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 279
LDI r11, 237
LDI r12, 116
LDI r13, 170
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
