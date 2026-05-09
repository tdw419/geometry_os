; DESCRIPTION: Composite: Draws a green line from (250, 253) to (291, 18) then Places a white dot at position (74, 154) then Places a cyan 39x39 rectangle at position (203, 106).
; PLAN: r0=250(x1), r1=253(y1), r2=291(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=154(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=106(y), r12=39(width), r13=39(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 253
LDI r2, 291
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 154
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 106
LDI r12, 39
LDI r13, 39
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
