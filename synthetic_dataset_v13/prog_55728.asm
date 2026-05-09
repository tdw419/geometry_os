; DESCRIPTION: Composite: Renders a yellow box of size 75x108 starting at (350, 40) then Draws a white line from (465, 74) to (51, 226).
; PLAN: r0=350(x), r1=40(y), r2=75(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x1), r6=74(y1), r7=51(x2), r8=226(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 40
LDI r2, 75
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 74
LDI r7, 51
LDI r8, 226
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
