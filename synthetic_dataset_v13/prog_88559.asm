; DESCRIPTION: Renders a purple box of size 51x31 starting at (305, 6).
; PLAN: r0=305(x), r1=6(y), r2=51(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 6
LDI r2, 51
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
