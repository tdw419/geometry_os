; DESCRIPTION: Composite: Places a orange dot at position (434, 26) then Renders a red box of size 75x78 starting at (34, 90) then Renders a orange line between points (313, 27) and (500, 180).
; PLAN: r0=434(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=34(x), r6=90(y), r7=75(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=27(y1), r12=500(x2), r13=180(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 34
LDI r6, 90
LDI r7, 75
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 27
LDI r12, 500
LDI r13, 180
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
