; DESCRIPTION: Places a red 51x37 rectangle at position (352, 194).
; PLAN: r0=352(x), r1=194(y), r2=51(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 194
LDI r2, 51
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
