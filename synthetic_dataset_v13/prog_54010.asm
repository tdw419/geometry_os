; DESCRIPTION: Composite: Renders a magenta line between points (307, 215) and (329, 127) then Places a yellow dot at position (266, 60).
; PLAN: r0=307(x1), r1=215(y1), r2=329(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 215
LDI r2, 329
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
