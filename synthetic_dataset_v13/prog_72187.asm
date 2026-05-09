; DESCRIPTION: Places a red 25x111 rectangle at position (183, 25).
; PLAN: r0=183(x), r1=25(y), r2=25(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 25
LDI r2, 25
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
