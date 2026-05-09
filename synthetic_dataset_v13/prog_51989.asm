; DESCRIPTION: Composite: Places a white dot at position (265, 249) then Places a yellow line segment connecting (297, 161) to (73, 126) then Draws a white rectangle at (275, 48) with width 92 and height 63.
; PLAN: r0=265(x), r1=249(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=297(x1), r6=161(y1), r7=73(x2), r8=126(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=48(y), r12=92(width), r13=63(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 249
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 161
LDI r7, 73
LDI r8, 126
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 48
LDI r12, 92
LDI r13, 63
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
