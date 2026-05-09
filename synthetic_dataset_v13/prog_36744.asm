; DESCRIPTION: Composite: Renders a yellow box of size 38x37 starting at (213, 197) then Renders a magenta disk with center (158, 162) and radius 61.
; PLAN: r0=213(x), r1=197(y), r2=38(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=162(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 197
LDI r2, 38
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 162
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
