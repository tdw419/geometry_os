; DESCRIPTION: Places a yellow 39x105 rectangle at position (53, 64).
; PLAN: r0=53(x), r1=64(y), r2=39(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 64
LDI r2, 39
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
