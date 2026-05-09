; DESCRIPTION: Composite: Places a white 107x68 rectangle at position (182, 49) then Places a blue dot at position (136, 153) then Renders a white line between points (51, 204) and (176, 18).
; PLAN: r0=182(x), r1=49(y), r2=107(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=204(y1), r12=176(x2), r13=18(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 49
LDI r2, 107
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 204
LDI r12, 176
LDI r13, 18
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
