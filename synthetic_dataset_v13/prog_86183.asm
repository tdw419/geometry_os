; DESCRIPTION: Places a black 113x63 rectangle at position (19, 39).
; PLAN: r0=19(x), r1=39(y), r2=113(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 39
LDI r2, 113
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
