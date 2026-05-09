; DESCRIPTION: Composite: Sets a single white pixel at (164, 30) then Draws a magenta line from (485, 242) to (399, 103) then Creates a red rectangular region at (182, 76) spanning 112 by 40 pixels.
; PLAN: r0=164(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=485(x1), r6=242(y1), r7=399(x2), r8=103(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=76(y), r12=112(width), r13=40(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 485
LDI r6, 242
LDI r7, 399
LDI r8, 103
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 76
LDI r12, 112
LDI r13, 40
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
