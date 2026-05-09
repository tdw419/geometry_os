; DESCRIPTION: Places a red 26x97 rectangle at position (380, 125).
; PLAN: r0=380(x), r1=125(y), r2=26(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 125
LDI r2, 26
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
