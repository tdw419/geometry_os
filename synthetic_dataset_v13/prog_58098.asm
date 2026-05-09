; DESCRIPTION: Places a green 61x76 rectangle at position (151, 96).
; PLAN: r0=151(x), r1=96(y), r2=61(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 96
LDI r2, 61
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
