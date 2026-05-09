; DESCRIPTION: Composite: Places a cyan dot at position (106, 236) then Renders a white box of size 88x10 starting at (21, 92) then Places a yellow line segment connecting (184, 217) to (213, 143).
; PLAN: r0=106(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=92(y), r7=88(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x1), r11=217(y1), r12=213(x2), r13=143(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 92
LDI r7, 88
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 217
LDI r12, 213
LDI r13, 143
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
