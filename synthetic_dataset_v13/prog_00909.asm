; DESCRIPTION: Places a black 75x53 rectangle at position (362, 173).
; PLAN: r0=362(x), r1=173(y), r2=75(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 173
LDI r2, 75
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
