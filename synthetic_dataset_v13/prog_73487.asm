; DESCRIPTION: Composite: Sets a single magenta pixel at (368, 152) then Draws a white rectangle at (202, 30) with width 90 and height 12 then Renders a green line between points (453, 106) and (118, 15).
; PLAN: r0=368(x), r1=152(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=30(y), r7=90(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x1), r11=106(y1), r12=118(x2), r13=15(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 152
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 30
LDI r7, 90
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 106
LDI r12, 118
LDI r13, 15
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
