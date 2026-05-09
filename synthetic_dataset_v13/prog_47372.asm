; DESCRIPTION: Composite: Sets a single yellow pixel at (213, 89) then Renders a green box of size 105x105 starting at (111, 72) then Draws a cyan line from (370, 14) to (419, 10).
; PLAN: r0=213(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=72(y), r7=105(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x1), r11=14(y1), r12=419(x2), r13=10(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 111
LDI r6, 72
LDI r7, 105
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 14
LDI r12, 419
LDI r13, 10
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
