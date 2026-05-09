; DESCRIPTION: Composite: Places a blue 109x92 rectangle at position (182, 146) then Sets a single orange pixel at (313, 117) then Places a green line segment connecting (13, 60) to (57, 202).
; PLAN: r0=182(x), r1=146(y), r2=109(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=60(y1), r12=57(x2), r13=202(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 146
LDI r2, 109
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 13
LDI r11, 60
LDI r12, 57
LDI r13, 202
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
