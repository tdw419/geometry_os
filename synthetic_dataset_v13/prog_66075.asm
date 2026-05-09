; DESCRIPTION: Composite: Places a yellow circle of radius 44 at center (161, 151) then Places a red 52x92 rectangle at position (131, 63).
; PLAN: r0=161(x), r1=151(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=63(y), r7=52(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 151
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 63
LDI r7, 52
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
