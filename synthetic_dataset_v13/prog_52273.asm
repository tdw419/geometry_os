; DESCRIPTION: Composite: Places a yellow dot at position (31, 188) then Renders a red box of size 93x51 starting at (284, 47).
; PLAN: r0=31(x), r1=188(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=47(y), r7=93(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 188
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 47
LDI r7, 93
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
