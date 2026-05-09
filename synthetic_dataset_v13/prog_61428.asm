; DESCRIPTION: Composite: Renders a yellow box of size 106x45 starting at (306, 114) then Renders a black line between points (92, 111) and (229, 250).
; PLAN: r0=306(x), r1=114(y), r2=106(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=111(y1), r7=229(x2), r8=250(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 114
LDI r2, 106
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 111
LDI r7, 229
LDI r8, 250
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
