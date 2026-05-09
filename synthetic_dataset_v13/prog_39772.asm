; DESCRIPTION: Places a red 39x77 rectangle at position (241, 178).
; PLAN: r0=241(x), r1=178(y), r2=39(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 178
LDI r2, 39
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
