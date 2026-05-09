; DESCRIPTION: Composite: Places a magenta dot at position (380, 101) then Renders a yellow line between points (347, 111) and (196, 29).
; PLAN: r0=380(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=111(y1), r7=196(x2), r8=29(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 111
LDI r7, 196
LDI r8, 29
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
