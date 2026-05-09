; DESCRIPTION: Renders a cyan box of size 51x110 starting at (321, 15).
; PLAN: r0=321(x), r1=15(y), r2=51(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 15
LDI r2, 51
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
