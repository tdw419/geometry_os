; DESCRIPTION: Composite: Places a magenta 103x65 rectangle at position (39, 174) then Places a red circle of radius 24 at center (136, 48).
; PLAN: r0=39(x), r1=174(y), r2=103(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=48(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 174
LDI r2, 103
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 48
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
