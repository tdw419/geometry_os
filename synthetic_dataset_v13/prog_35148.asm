; DESCRIPTION: Composite: Places a magenta line segment connecting (461, 221) to (213, 35) then Places a black dot at position (356, 196).
; PLAN: r0=461(x1), r1=221(y1), r2=213(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=196(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 221
LDI r2, 213
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 196
LDI r7, 0x000000
PSET r5, r6, r7
HALT
