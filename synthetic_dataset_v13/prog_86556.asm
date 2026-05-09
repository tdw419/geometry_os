; DESCRIPTION: Composite: Places a red 19x66 rectangle at position (249, 162) then Renders a yellow disk with center (116, 138) and radius 72.
; PLAN: r0=249(x), r1=162(y), r2=19(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=138(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 162
LDI r2, 19
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 138
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
