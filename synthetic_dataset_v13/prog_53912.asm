; DESCRIPTION: Composite: Renders a red line between points (234, 12) and (430, 234) then Places a yellow dot at position (61, 167) then Places a cyan 45x19 rectangle at position (370, 193).
; PLAN: r0=234(x1), r1=12(y1), r2=430(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=167(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=193(y), r12=45(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 12
LDI r2, 430
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 167
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 370
LDI r11, 193
LDI r12, 45
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
