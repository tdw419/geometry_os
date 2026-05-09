; DESCRIPTION: Composite: Places a magenta 116x119 rectangle at position (168, 58) then Places a green line segment connecting (74, 28) to (134, 156).
; PLAN: r0=168(x), r1=58(y), r2=116(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=28(y1), r7=134(x2), r8=156(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 58
LDI r2, 116
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 28
LDI r7, 134
LDI r8, 156
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
