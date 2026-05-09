; DESCRIPTION: Composite: Places a cyan dot at position (438, 113) then Places a cyan 37x105 rectangle at position (211, 94) then Places a cyan line segment connecting (356, 158) to (189, 83).
; PLAN: r0=438(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=94(y), r7=37(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x1), r11=158(y1), r12=189(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 94
LDI r7, 37
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 158
LDI r12, 189
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
