; DESCRIPTION: Composite: Draws a green line from (31, 11) to (433, 129) then Sets a single yellow pixel at (412, 167) then Places a green 120x60 rectangle at position (270, 58).
; PLAN: r0=31(x1), r1=11(y1), r2=433(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=167(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=270(x), r11=58(y), r12=120(width), r13=60(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 11
LDI r2, 433
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 167
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 270
LDI r11, 58
LDI r12, 120
LDI r13, 60
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
