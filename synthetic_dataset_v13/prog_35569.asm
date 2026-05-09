; DESCRIPTION: Composite: Renders a black line between points (64, 66) and (488, 163) then Places a cyan dot at position (218, 108).
; PLAN: r0=64(x1), r1=66(y1), r2=488(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=108(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 66
LDI r2, 488
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 108
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
