; DESCRIPTION: Places a black 54x23 rectangle at position (455, 95).
; PLAN: r0=455(x), r1=95(y), r2=54(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 95
LDI r2, 54
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
