; DESCRIPTION: Composite: Draws a red line from (337, 172) to (31, 5) then Places a purple dot at position (18, 103) then Creates a cyan rectangular region at (272, 51) spanning 111 by 70 pixels.
; PLAN: r0=337(x1), r1=172(y1), r2=31(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=51(y), r12=111(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 172
LDI r2, 31
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 272
LDI r11, 51
LDI r12, 111
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
