; DESCRIPTION: Composite: Places a cyan dot at position (28, 210) then Creates a red rectangular region at (42, 26) spanning 112 by 111 pixels then Draws a black line from (216, 133) to (95, 120).
; PLAN: r0=28(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=26(y), r7=112(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x1), r11=133(y1), r12=95(x2), r13=120(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 26
LDI r7, 112
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 133
LDI r12, 95
LDI r13, 120
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
