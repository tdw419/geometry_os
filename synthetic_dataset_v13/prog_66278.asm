; DESCRIPTION: Places a red 113x118 rectangle at position (82, 108).
; PLAN: r0=82(x), r1=108(y), r2=113(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 108
LDI r2, 113
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
