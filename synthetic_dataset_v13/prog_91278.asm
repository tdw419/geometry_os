; DESCRIPTION: Composite: Renders a red box of size 72x57 starting at (27, 135) then Draws a black line from (118, 74) to (319, 117).
; PLAN: r0=27(x), r1=135(y), r2=72(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=74(y1), r7=319(x2), r8=117(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 135
LDI r2, 72
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 74
LDI r7, 319
LDI r8, 117
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
