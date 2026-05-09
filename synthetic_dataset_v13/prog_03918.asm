; DESCRIPTION: Composite: Places a magenta 103x38 rectangle at position (397, 142) then Renders a yellow disk with center (268, 47) and radius 40.
; PLAN: r0=397(x), r1=142(y), r2=103(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=47(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 142
LDI r2, 103
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 47
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
