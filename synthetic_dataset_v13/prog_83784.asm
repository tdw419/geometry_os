; DESCRIPTION: Composite: Renders a red line between points (423, 51) and (44, 209) then Draws a black rectangle at (221, 213) with width 61 and height 27.
; PLAN: r0=423(x1), r1=51(y1), r2=44(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=213(y), r7=61(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 51
LDI r2, 44
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 213
LDI r7, 61
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
