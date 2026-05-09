; DESCRIPTION: Renders a cyan box of size 37x51 starting at (380, 180).
; PLAN: r0=380(x), r1=180(y), r2=37(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 180
LDI r2, 37
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
