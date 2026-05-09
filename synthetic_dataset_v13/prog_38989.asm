; DESCRIPTION: Composite: Places a magenta line segment connecting (463, 42) to (368, 38) then Places a blue 111x61 rectangle at position (165, 59) then Sets a single yellow pixel at (507, 71).
; PLAN: r0=463(x1), r1=42(y1), r2=368(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=59(y), r7=111(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=507(x), r11=71(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 42
LDI r2, 368
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 59
LDI r7, 111
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 71
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
