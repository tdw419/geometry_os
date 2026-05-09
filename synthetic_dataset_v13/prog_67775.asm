; DESCRIPTION: Composite: Places a black dot at position (265, 157) then Places a white 60x102 rectangle at position (92, 83) then Draws a yellow line from (73, 21) to (78, 210).
; PLAN: r0=265(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=83(y), r7=60(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x1), r11=21(y1), r12=78(x2), r13=210(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 92
LDI r6, 83
LDI r7, 60
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 21
LDI r12, 78
LDI r13, 210
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
