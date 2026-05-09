; DESCRIPTION: Places a red 96x57 rectangle at position (414, 25).
; PLAN: r0=414(x), r1=25(y), r2=96(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 25
LDI r2, 96
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
