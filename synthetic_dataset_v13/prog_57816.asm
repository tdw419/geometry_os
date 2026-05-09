; DESCRIPTION: Places a red 39x26 rectangle at position (147, 171).
; PLAN: r0=147(x), r1=171(y), r2=39(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 171
LDI r2, 39
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
