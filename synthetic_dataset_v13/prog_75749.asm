; DESCRIPTION: Composite: Sets a single white pixel at (52, 204) then Draws a yellow rectangle at (97, 73) with width 113 and height 114 then Renders a purple line between points (277, 143) and (221, 210).
; PLAN: r0=52(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=73(y), r7=113(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x1), r11=143(y1), r12=221(x2), r13=210(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 73
LDI r7, 113
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 143
LDI r12, 221
LDI r13, 210
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
