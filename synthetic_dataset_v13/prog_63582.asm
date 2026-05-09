; DESCRIPTION: Composite: Creates a blue rectangular region at (30, 108) spanning 92 by 23 pixels then Places a cyan dot at position (0, 77) then Draws a yellow line from (397, 1) to (296, 149).
; PLAN: r0=30(x), r1=108(y), r2=92(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=77(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=397(x1), r11=1(y1), r12=296(x2), r13=149(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 108
LDI r2, 92
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 77
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 397
LDI r11, 1
LDI r12, 296
LDI r13, 149
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
