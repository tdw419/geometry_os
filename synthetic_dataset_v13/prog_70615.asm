; DESCRIPTION: Places a red 76x115 rectangle at position (58, 124).
; PLAN: r0=58(x), r1=124(y), r2=76(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 124
LDI r2, 76
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
