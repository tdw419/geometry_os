; DESCRIPTION: Composite: Sets a single green pixel at (234, 205) then Renders a red box of size 75x39 starting at (208, 15) then Renders a black line between points (162, 141) and (256, 177).
; PLAN: r0=234(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=15(y), r7=75(width), r8=39(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=141(y1), r12=256(x2), r13=177(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 208
LDI r6, 15
LDI r7, 75
LDI r8, 39
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 141
LDI r12, 256
LDI r13, 177
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
