; DESCRIPTION: Renders a cyan box of size 35x51 starting at (47, 98).
; PLAN: r0=47(x), r1=98(y), r2=35(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 98
LDI r2, 35
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
