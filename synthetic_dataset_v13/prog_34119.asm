; DESCRIPTION: Composite: Places a purple dot at position (138, 108) then Places a yellow line segment connecting (7, 247) to (141, 93) then Renders a green box of size 76x28 starting at (286, 161).
; PLAN: r0=138(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=247(y1), r7=141(x2), r8=93(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=161(y), r12=76(width), r13=28(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 247
LDI r7, 141
LDI r8, 93
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 161
LDI r12, 76
LDI r13, 28
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
