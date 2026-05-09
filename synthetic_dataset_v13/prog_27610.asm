; DESCRIPTION: Composite: Renders a magenta line between points (209, 100) and (103, 101) then Places a blue 44x98 rectangle at position (39, 73).
; PLAN: r0=209(x1), r1=100(y1), r2=103(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=73(y), r7=44(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 100
LDI r2, 103
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 73
LDI r7, 44
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
