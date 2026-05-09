; DESCRIPTION: Places a red 39x55 rectangle at position (167, 74).
; PLAN: r0=167(x), r1=74(y), r2=39(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 74
LDI r2, 39
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
