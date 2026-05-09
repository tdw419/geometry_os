; DESCRIPTION: Composite: Sets a single white pixel at (227, 58) then Renders a cyan disk with center (214, 178) and radius 67 then Draws a red line from (8, 34) to (84, 186).
; PLAN: r0=227(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=178(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x1), r11=34(y1), r12=84(x2), r13=186(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 178
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 34
LDI r12, 84
LDI r13, 186
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
