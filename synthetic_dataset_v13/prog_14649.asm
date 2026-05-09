; DESCRIPTION: Composite: Renders a magenta line between points (33, 135) and (420, 203) then Places a black 110x16 rectangle at position (158, 137).
; PLAN: r0=33(x1), r1=135(y1), r2=420(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=137(y), r7=110(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 135
LDI r2, 420
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 137
LDI r7, 110
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
