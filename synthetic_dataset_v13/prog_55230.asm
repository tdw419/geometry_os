; DESCRIPTION: Composite: Places a purple circle of radius 39 at center (401, 46) then Creates a orange rectangular region at (125, 175) spanning 71 by 61 pixels then Draws a cyan line from (262, 231) to (511, 121).
; PLAN: r0=401(x), r1=46(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=175(y), r7=71(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x1), r11=231(y1), r12=511(x2), r13=121(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 46
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 175
LDI r7, 71
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 231
LDI r12, 511
LDI r13, 121
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
