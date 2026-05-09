; DESCRIPTION: Places a red 85x67 rectangle at position (214, 51).
; PLAN: r0=214(x), r1=51(y), r2=85(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 51
LDI r2, 85
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
