; DESCRIPTION: Composite: Places a red dot at position (214, 64) then Places a green line segment connecting (212, 23) to (231, 230) then Places a red 93x46 rectangle at position (105, 184).
; PLAN: r0=214(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=212(x1), r6=23(y1), r7=231(x2), r8=230(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=184(y), r12=93(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 212
LDI r6, 23
LDI r7, 231
LDI r8, 230
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 184
LDI r12, 93
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
