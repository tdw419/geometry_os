; DESCRIPTION: Composite: Sets a single blue pixel at (445, 245) then Renders a cyan line between points (20, 214) and (62, 195) then Places a red 116x63 rectangle at position (14, 65).
; PLAN: r0=445(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=214(y1), r7=62(x2), r8=195(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=14(x), r11=65(y), r12=116(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 214
LDI r7, 62
LDI r8, 195
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 65
LDI r12, 116
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
