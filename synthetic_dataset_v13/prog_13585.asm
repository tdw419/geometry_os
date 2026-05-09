; DESCRIPTION: Composite: Places a purple 77x108 rectangle at position (32, 136) then Places a yellow line segment connecting (383, 154) to (262, 134).
; PLAN: r0=32(x), r1=136(y), r2=77(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=154(y1), r7=262(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 136
LDI r2, 77
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 154
LDI r7, 262
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
