; DESCRIPTION: Places a blue 120x116 rectangle at position (189, 52).
; PLAN: r0=189(x), r1=52(y), r2=120(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 52
LDI r2, 120
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
