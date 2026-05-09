; DESCRIPTION: Places a red 35x43 rectangle at position (196, 19).
; PLAN: r0=196(x), r1=19(y), r2=35(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 19
LDI r2, 35
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
