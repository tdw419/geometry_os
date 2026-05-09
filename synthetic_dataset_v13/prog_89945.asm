; DESCRIPTION: Composite: Places a green dot at position (51, 58) then Renders a blue line between points (393, 57) and (363, 71) then Places a blue 39x35 rectangle at position (36, 191).
; PLAN: r0=51(x), r1=58(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=393(x1), r6=57(y1), r7=363(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=36(x), r11=191(y), r12=39(width), r13=35(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 58
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 393
LDI r6, 57
LDI r7, 363
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 191
LDI r12, 39
LDI r13, 35
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
