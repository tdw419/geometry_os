; DESCRIPTION: Composite: Places a black 46x106 rectangle at position (387, 81) then Places a yellow dot at position (79, 71).
; PLAN: r0=387(x), r1=81(y), r2=46(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=71(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 81
LDI r2, 46
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 71
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
