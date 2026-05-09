; DESCRIPTION: Places a red 103x47 rectangle at position (194, 183).
; PLAN: r0=194(x), r1=183(y), r2=103(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 183
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
