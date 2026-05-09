; DESCRIPTION: Places a green 73x43 rectangle at position (143, 81).
; PLAN: r0=143(x), r1=81(y), r2=73(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 81
LDI r2, 73
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
