; DESCRIPTION: Places a red 92x39 rectangle at position (348, 36).
; PLAN: r0=348(x), r1=36(y), r2=92(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 36
LDI r2, 92
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
