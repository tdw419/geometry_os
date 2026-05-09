; DESCRIPTION: Composite: Draws a green line from (455, 71) to (492, 136) then Places a magenta dot at position (458, 92).
; PLAN: r0=455(x1), r1=71(y1), r2=492(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=92(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 71
LDI r2, 492
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 92
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
