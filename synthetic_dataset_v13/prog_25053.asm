; DESCRIPTION: Composite: Places a green dot at position (377, 126) then Renders a yellow line between points (247, 15) and (167, 161) then Renders a red box of size 92x71 starting at (115, 31).
; PLAN: r0=377(x), r1=126(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=15(y1), r7=167(x2), r8=161(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=31(y), r12=92(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 126
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 15
LDI r7, 167
LDI r8, 161
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 31
LDI r12, 92
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
