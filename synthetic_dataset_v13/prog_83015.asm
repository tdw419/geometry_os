; DESCRIPTION: Places a red 25x55 rectangle at position (486, 194).
; PLAN: r0=486(x), r1=194(y), r2=25(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 194
LDI r2, 25
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
