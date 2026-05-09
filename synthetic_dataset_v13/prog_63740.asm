; DESCRIPTION: Composite: Sets a single white pixel at (60, 165) then Places a magenta line segment connecting (123, 84) to (27, 236) then Renders a red box of size 48x38 starting at (347, 112).
; PLAN: r0=60(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=84(y1), r7=27(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=112(y), r12=48(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 84
LDI r7, 27
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 112
LDI r12, 48
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
