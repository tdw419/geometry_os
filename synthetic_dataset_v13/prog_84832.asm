; DESCRIPTION: Composite: Renders a red box of size 19x60 starting at (108, 143) then Sets a single white pixel at (363, 51) then Renders a magenta line between points (154, 161) and (418, 124).
; PLAN: r0=108(x), r1=143(y), r2=19(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=51(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=161(y1), r12=418(x2), r13=124(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 143
LDI r2, 19
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 51
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 161
LDI r12, 418
LDI r13, 124
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
