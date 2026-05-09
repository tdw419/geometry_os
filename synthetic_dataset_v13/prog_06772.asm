; DESCRIPTION: Places a red 55x103 rectangle at position (259, 31).
; PLAN: r0=259(x), r1=31(y), r2=55(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 31
LDI r2, 55
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
