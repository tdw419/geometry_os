; DESCRIPTION: Composite: Places a magenta 85x101 rectangle at position (187, 51) then Renders a orange disk with center (305, 111) and radius 58.
; PLAN: r0=187(x), r1=51(y), r2=85(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=111(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 51
LDI r2, 85
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 111
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
