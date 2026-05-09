; DESCRIPTION: Places a cyan 100x116 rectangle at position (19, 120).
; PLAN: r0=19(x), r1=120(y), r2=100(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 100
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
