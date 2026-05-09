; DESCRIPTION: Composite: Renders a black line between points (23, 162) and (50, 103) then Places a purple 101x73 rectangle at position (134, 113).
; PLAN: r0=23(x1), r1=162(y1), r2=50(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=113(y), r7=101(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 162
LDI r2, 50
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 113
LDI r7, 101
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
