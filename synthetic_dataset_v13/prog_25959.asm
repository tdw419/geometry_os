; DESCRIPTION: Composite: Places a magenta 59x114 rectangle at position (227, 124) then Renders a yellow disk with center (429, 72) and radius 46.
; PLAN: r0=227(x), r1=124(y), r2=59(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=72(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 124
LDI r2, 59
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 72
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
