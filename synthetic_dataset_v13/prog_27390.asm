; DESCRIPTION: Places a red 29x95 rectangle at position (165, 18).
; PLAN: r0=165(x), r1=18(y), r2=29(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 18
LDI r2, 29
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
