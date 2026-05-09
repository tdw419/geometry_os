; DESCRIPTION: Composite: Draws a red circle centered at (262, 167) with radius 32 then Sets a single white pixel at (171, 91) then Draws a cyan line from (305, 88) to (217, 222).
; PLAN: r0=262(x), r1=167(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=91(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=305(x1), r11=88(y1), r12=217(x2), r13=222(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 167
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 91
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 305
LDI r11, 88
LDI r12, 217
LDI r13, 222
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
