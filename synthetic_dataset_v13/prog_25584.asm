; DESCRIPTION: Composite: Places a magenta dot at position (66, 15) then Renders a orange box of size 29x28 starting at (197, 204) then Renders a magenta line between points (15, 178) and (329, 240).
; PLAN: r0=66(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=204(y), r7=29(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x1), r11=178(y1), r12=329(x2), r13=240(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 204
LDI r7, 29
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 178
LDI r12, 329
LDI r13, 240
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
