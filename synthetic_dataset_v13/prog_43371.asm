; DESCRIPTION: Places a black 120x81 rectangle at position (288, 34).
; PLAN: r0=288(x), r1=34(y), r2=120(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 34
LDI r2, 120
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
