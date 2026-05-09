; DESCRIPTION: Places a green 51x36 rectangle at position (182, 15).
; PLAN: r0=182(x), r1=15(y), r2=51(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 15
LDI r2, 51
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
