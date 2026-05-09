; DESCRIPTION: Composite: Draws a cyan line from (131, 228) to (17, 1) then Places a magenta dot at position (383, 253) then Creates a red rectangular region at (311, 166) spanning 110 by 49 pixels.
; PLAN: r0=131(x1), r1=228(y1), r2=17(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=253(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=166(y), r12=110(width), r13=49(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 228
LDI r2, 17
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 253
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 311
LDI r11, 166
LDI r12, 110
LDI r13, 49
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
