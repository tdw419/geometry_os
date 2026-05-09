; DESCRIPTION: Places a red 50x19 rectangle at position (455, 114).
; PLAN: r0=455(x), r1=114(y), r2=50(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 114
LDI r2, 50
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
