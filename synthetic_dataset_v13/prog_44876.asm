; DESCRIPTION: Places a red 113x105 rectangle at position (241, 26).
; PLAN: r0=241(x), r1=26(y), r2=113(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 26
LDI r2, 113
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
