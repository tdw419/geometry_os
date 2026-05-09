; DESCRIPTION: Composite: Draws a yellow line from (202, 158) to (433, 154) then Places a purple 44x116 rectangle at position (338, 47).
; PLAN: r0=202(x1), r1=158(y1), r2=433(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=47(y), r7=44(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 158
LDI r2, 433
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 47
LDI r7, 44
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
