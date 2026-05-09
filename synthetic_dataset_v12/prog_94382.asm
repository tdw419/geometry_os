; DESCRIPTION: Places a red 61x73 rectangle at position (349, 18).
; PLAN: r0=349(x), r1=18(y), r2=61(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 18
LDI r2, 61
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
