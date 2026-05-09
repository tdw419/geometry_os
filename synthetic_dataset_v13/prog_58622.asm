; DESCRIPTION: Places a red 93x96 rectangle at position (403, 138).
; PLAN: r0=403(x), r1=138(y), r2=93(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 138
LDI r2, 93
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
