; DESCRIPTION: Composite: Draws a white line from (384, 76) to (102, 177) then Places a green dot at position (182, 112).
; PLAN: r0=384(x1), r1=76(y1), r2=102(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 76
LDI r2, 102
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
