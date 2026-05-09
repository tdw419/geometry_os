; DESCRIPTION: Places a red 24x72 rectangle at position (380, 88).
; PLAN: r0=380(x), r1=88(y), r2=24(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 88
LDI r2, 24
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
