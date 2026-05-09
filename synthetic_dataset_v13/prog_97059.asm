; DESCRIPTION: Composite: Places a blue dot at position (348, 122) then Renders a red box of size 47x28 starting at (413, 219) then Draws a blue line from (401, 137) to (379, 75).
; PLAN: r0=348(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=219(y), r7=47(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x1), r11=137(y1), r12=379(x2), r13=75(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 122
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 219
LDI r7, 47
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 137
LDI r12, 379
LDI r13, 75
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
