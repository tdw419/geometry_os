; DESCRIPTION: Composite: Places a red 93x120 rectangle at position (14, 102) then Draws a magenta line from (237, 115) to (232, 27) then Places a yellow dot at position (397, 174).
; PLAN: r0=14(x), r1=102(y), r2=93(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x1), r6=115(y1), r7=232(x2), r8=27(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=174(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 102
LDI r2, 93
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 115
LDI r7, 232
LDI r8, 27
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 174
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
