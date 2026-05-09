; DESCRIPTION: Composite: Places a green dot at position (506, 82) then Places a cyan line segment connecting (281, 236) to (241, 62) then Places a cyan 63x12 rectangle at position (134, 108).
; PLAN: r0=506(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=281(x1), r6=236(y1), r7=241(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=108(y), r12=63(width), r13=12(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 236
LDI r7, 241
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 108
LDI r12, 63
LDI r13, 12
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
