; DESCRIPTION: Composite: Sets a single white pixel at (437, 145) then Renders a black box of size 112x32 starting at (65, 126) then Renders a magenta line between points (125, 163) and (413, 214).
; PLAN: r0=437(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=126(y), r7=112(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x1), r11=163(y1), r12=413(x2), r13=214(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 126
LDI r7, 112
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 163
LDI r12, 413
LDI r13, 214
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
