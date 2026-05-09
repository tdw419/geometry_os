; DESCRIPTION: Composite: Renders a green box of size 48x51 starting at (363, 89) then Places a white dot at position (98, 173).
; PLAN: r0=363(x), r1=89(y), r2=48(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 89
LDI r2, 48
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
