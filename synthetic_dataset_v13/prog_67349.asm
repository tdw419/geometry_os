; DESCRIPTION: Composite: Renders a red box of size 44x27 starting at (17, 145) then Renders a red line between points (53, 229) and (238, 171).
; PLAN: r0=17(x), r1=145(y), r2=44(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x1), r6=229(y1), r7=238(x2), r8=171(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 145
LDI r2, 44
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 229
LDI r7, 238
LDI r8, 171
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
