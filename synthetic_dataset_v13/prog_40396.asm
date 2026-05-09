; DESCRIPTION: Places a black 25x25 rectangle at position (226, 127).
; PLAN: r0=226(x), r1=127(y), r2=25(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 127
LDI r2, 25
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
