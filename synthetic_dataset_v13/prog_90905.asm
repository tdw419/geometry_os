; DESCRIPTION: Places a black 82x68 rectangle at position (1, 127).
; PLAN: r0=1(x), r1=127(y), r2=82(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 127
LDI r2, 82
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
