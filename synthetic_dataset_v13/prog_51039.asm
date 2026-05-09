; DESCRIPTION: Renders a cyan box of size 51x103 starting at (230, 62).
; PLAN: r0=230(x), r1=62(y), r2=51(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 62
LDI r2, 51
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
