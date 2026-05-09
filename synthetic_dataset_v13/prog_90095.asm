; DESCRIPTION: Composite: Draws a purple line from (224, 166) to (73, 171) then Renders a black box of size 55x103 starting at (279, 80) then Places a red dot at position (158, 57).
; PLAN: r0=224(x1), r1=166(y1), r2=73(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=80(y), r7=55(width), r8=103(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=57(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 166
LDI r2, 73
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 80
LDI r7, 55
LDI r8, 103
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 57
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
