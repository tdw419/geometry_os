; DESCRIPTION: Composite: Places a magenta dot at position (301, 111) then Draws a yellow line from (391, 173) to (18, 159).
; PLAN: r0=301(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=173(y1), r7=18(x2), r8=159(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 173
LDI r7, 18
LDI r8, 159
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
