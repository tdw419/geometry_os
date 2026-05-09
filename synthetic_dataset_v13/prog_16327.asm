; DESCRIPTION: Composite: Sets a single green pixel at (47, 127) then Draws a magenta line from (327, 0) to (372, 182).
; PLAN: r0=47(x), r1=127(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=0(y1), r7=372(x2), r8=182(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 127
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 0
LDI r7, 372
LDI r8, 182
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
