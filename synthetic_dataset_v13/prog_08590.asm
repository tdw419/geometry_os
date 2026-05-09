; DESCRIPTION: Places a red 74x113 rectangle at position (358, 2).
; PLAN: r0=358(x), r1=2(y), r2=74(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 2
LDI r2, 74
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
