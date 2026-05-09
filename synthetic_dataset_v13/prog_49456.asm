; DESCRIPTION: Composite: Creates a green circular shape at (54, 59) with radius 22 then Places a magenta dot at position (59, 95).
; PLAN: r0=54(x), r1=59(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=95(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 59
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 95
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
