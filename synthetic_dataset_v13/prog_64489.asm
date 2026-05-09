; DESCRIPTION: Places a red 76x14 rectangle at position (358, 173).
; PLAN: r0=358(x), r1=173(y), r2=76(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 173
LDI r2, 76
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
