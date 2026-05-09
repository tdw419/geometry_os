; DESCRIPTION: Composite: Renders a white box of size 64x59 starting at (174, 10) then Sets a single magenta pixel at (437, 237) then Renders a magenta line between points (329, 186) and (171, 82).
; PLAN: r0=174(x), r1=10(y), r2=64(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=237(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=329(x1), r11=186(y1), r12=171(x2), r13=82(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 10
LDI r2, 64
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 237
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 329
LDI r11, 186
LDI r12, 171
LDI r13, 82
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
