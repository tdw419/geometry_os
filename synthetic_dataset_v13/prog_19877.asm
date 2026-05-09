; DESCRIPTION: Composite: Places a cyan dot at position (211, 56) then Draws a cyan rectangle at (44, 134) with width 77 and height 108 then Draws a black line from (256, 228) to (442, 86).
; PLAN: r0=211(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=134(y), r7=77(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x1), r11=228(y1), r12=442(x2), r13=86(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 44
LDI r6, 134
LDI r7, 77
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 228
LDI r12, 442
LDI r13, 86
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
