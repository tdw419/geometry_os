; DESCRIPTION: Composite: Draws a red line from (394, 124) to (298, 218) then Sets a single magenta pixel at (78, 176) then Renders a white box of size 42x93 starting at (161, 125).
; PLAN: r0=394(x1), r1=124(y1), r2=298(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=125(y), r12=42(width), r13=93(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 124
LDI r2, 298
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 125
LDI r12, 42
LDI r13, 93
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
