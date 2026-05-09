; DESCRIPTION: Composite: Renders a yellow box of size 61x36 starting at (218, 101) then Places a yellow dot at position (151, 186).
; PLAN: r0=218(x), r1=101(y), r2=61(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 101
LDI r2, 61
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
