; DESCRIPTION: Composite: Sets a single white pixel at (38, 100) then Places a magenta line segment connecting (133, 98) to (28, 132) then Places a magenta 117x95 rectangle at position (262, 80).
; PLAN: r0=38(x), r1=100(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=98(y1), r7=28(x2), r8=132(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=80(y), r12=117(width), r13=95(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 100
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 98
LDI r7, 28
LDI r8, 132
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 80
LDI r12, 117
LDI r13, 95
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
