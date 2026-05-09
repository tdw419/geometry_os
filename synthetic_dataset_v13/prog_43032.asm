; DESCRIPTION: Places a black 47x90 rectangle at position (362, 135).
; PLAN: r0=362(x), r1=135(y), r2=47(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 135
LDI r2, 47
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
