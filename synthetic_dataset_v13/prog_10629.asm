; DESCRIPTION: Composite: Places a green dot at position (132, 228) then Renders a white line between points (243, 235) and (134, 9) then Places a black 78x49 rectangle at position (126, 179).
; PLAN: r0=132(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=243(x1), r6=235(y1), r7=134(x2), r8=9(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=179(y), r12=78(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 228
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 235
LDI r7, 134
LDI r8, 9
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 179
LDI r12, 78
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
