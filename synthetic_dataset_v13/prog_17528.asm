; DESCRIPTION: Composite: Places a green 36x79 rectangle at position (53, 70) then Creates a red circular shape at (169, 91) with radius 54.
; PLAN: r0=53(x), r1=70(y), r2=36(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=91(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 70
LDI r2, 36
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 91
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
