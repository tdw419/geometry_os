; DESCRIPTION: Composite: Draws a purple line from (39, 132) to (67, 167) then Places a white 55x76 rectangle at position (27, 56).
; PLAN: r0=39(x1), r1=132(y1), r2=67(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=56(y), r7=55(width), r8=76(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 132
LDI r2, 67
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 56
LDI r7, 55
LDI r8, 76
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
