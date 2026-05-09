; DESCRIPTION: Places a red 71x55 rectangle at position (26, 112).
; PLAN: r0=26(x), r1=112(y), r2=71(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 112
LDI r2, 71
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
