; DESCRIPTION: Composite: Places a red dot at position (452, 5) then Renders a white line between points (468, 127) and (67, 193) then Renders a green box of size 111x108 starting at (333, 93).
; PLAN: r0=452(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=127(y1), r7=67(x2), r8=193(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=93(y), r12=111(width), r13=108(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 468
LDI r6, 127
LDI r7, 67
LDI r8, 193
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 93
LDI r12, 111
LDI r13, 108
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
