; DESCRIPTION: Places a red 77x43 rectangle at position (32, 197).
; PLAN: r0=32(x), r1=197(y), r2=77(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 197
LDI r2, 77
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
