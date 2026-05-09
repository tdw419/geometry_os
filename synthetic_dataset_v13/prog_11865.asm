; DESCRIPTION: Composite: Places a red 106x51 rectangle at position (288, 164) then Places a red dot at position (332, 85).
; PLAN: r0=288(x), r1=164(y), r2=106(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=85(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 164
LDI r2, 106
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 85
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
