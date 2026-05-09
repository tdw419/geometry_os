; DESCRIPTION: Composite: Places a magenta dot at position (350, 161) then Places a white 74x119 rectangle at position (426, 125) then Renders a yellow line between points (187, 32) and (203, 24).
; PLAN: r0=350(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=125(y), r7=74(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x1), r11=32(y1), r12=203(x2), r13=24(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 125
LDI r7, 74
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 32
LDI r12, 203
LDI r13, 24
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
