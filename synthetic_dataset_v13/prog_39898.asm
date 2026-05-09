; DESCRIPTION: Places a red 44x82 rectangle at position (51, 37).
; PLAN: r0=51(x), r1=37(y), r2=44(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 37
LDI r2, 44
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
