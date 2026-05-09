; DESCRIPTION: Places a red 61x95 rectangle at position (191, 112).
; PLAN: r0=191(x), r1=112(y), r2=61(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 112
LDI r2, 61
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
