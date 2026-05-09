; DESCRIPTION: Composite: Sets a single red pixel at (357, 43) then Renders a red box of size 98x27 starting at (321, 68) then Places a blue line segment connecting (162, 240) to (288, 253).
; PLAN: r0=357(x), r1=43(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=68(y), r7=98(width), r8=27(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=240(y1), r12=288(x2), r13=253(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 43
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 68
LDI r7, 98
LDI r8, 27
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 240
LDI r12, 288
LDI r13, 253
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
