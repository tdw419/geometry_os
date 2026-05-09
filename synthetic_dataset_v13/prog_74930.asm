; DESCRIPTION: Composite: Draws a green line from (114, 215) to (419, 88) then Places a magenta dot at position (328, 247).
; PLAN: r0=114(x1), r1=215(y1), r2=419(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 215
LDI r2, 419
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
