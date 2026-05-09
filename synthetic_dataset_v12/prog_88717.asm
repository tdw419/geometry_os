; DESCRIPTION: Places a red 73x38 rectangle at position (216, 55).
; PLAN: r0=216(x), r1=55(y), r2=73(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 55
LDI r2, 73
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
