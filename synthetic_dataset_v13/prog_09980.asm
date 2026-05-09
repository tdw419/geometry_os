; DESCRIPTION: Places a blue 61x98 rectangle at position (112, 73).
; PLAN: r0=112(x), r1=73(y), r2=61(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 73
LDI r2, 61
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
