; DESCRIPTION: Composite: Places a magenta dot at position (121, 168) then Draws a green circle centered at (245, 123) with radius 58.
; PLAN: r0=121(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=123(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 123
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
