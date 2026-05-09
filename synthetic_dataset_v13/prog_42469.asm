; DESCRIPTION: Composite: Places a red 33x32 rectangle at position (427, 61) then Renders a magenta disk with center (208, 122) and radius 54.
; PLAN: r0=427(x), r1=61(y), r2=33(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=122(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 61
LDI r2, 33
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 122
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
