; DESCRIPTION: Places a cyan 116x49 rectangle at position (24, 171).
; PLAN: r0=24(x), r1=171(y), r2=116(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 171
LDI r2, 116
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
