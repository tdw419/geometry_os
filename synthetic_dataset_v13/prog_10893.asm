; DESCRIPTION: Composite: Places a orange 101x81 rectangle at position (405, 76) then Places a cyan dot at position (332, 60) then Renders a cyan line between points (387, 181) and (129, 157).
; PLAN: r0=405(x), r1=76(y), r2=101(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=60(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=387(x1), r11=181(y1), r12=129(x2), r13=157(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 76
LDI r2, 101
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 60
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 181
LDI r12, 129
LDI r13, 157
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
