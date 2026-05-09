; DESCRIPTION: Composite: Places a magenta dot at position (338, 130) then Draws a yellow line from (86, 197) to (135, 194) then Renders a white box of size 93x51 starting at (5, 161).
; PLAN: r0=338(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=197(y1), r7=135(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=161(y), r12=93(width), r13=51(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 197
LDI r7, 135
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 161
LDI r12, 93
LDI r13, 51
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
