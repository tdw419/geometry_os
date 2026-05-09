; DESCRIPTION: Composite: Places a white dot at position (384, 181) then Renders a black line between points (421, 162) and (202, 28) then Renders a red box of size 84x28 starting at (167, 99).
; PLAN: r0=384(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=421(x1), r6=162(y1), r7=202(x2), r8=28(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=99(y), r12=84(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 162
LDI r7, 202
LDI r8, 28
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 99
LDI r12, 84
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
