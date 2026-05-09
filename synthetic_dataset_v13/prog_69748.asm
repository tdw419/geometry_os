; DESCRIPTION: Composite: Creates a purple rectangular region at (117, 186) spanning 47 by 65 pixels then Places a magenta dot at position (174, 163) then Places a green line segment connecting (167, 70) to (429, 70).
; PLAN: r0=117(x), r1=186(y), r2=47(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=163(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=167(x1), r11=70(y1), r12=429(x2), r13=70(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 186
LDI r2, 47
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 163
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 167
LDI r11, 70
LDI r12, 429
LDI r13, 70
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
