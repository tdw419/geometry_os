; DESCRIPTION: Places a orange 72x105 rectangle at position (182, 121).
; PLAN: r0=182(x), r1=121(y), r2=72(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 121
LDI r2, 72
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
