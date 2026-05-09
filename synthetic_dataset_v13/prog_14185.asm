; DESCRIPTION: Places a black 91x85 rectangle at position (411, 134).
; PLAN: r0=411(x), r1=134(y), r2=91(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 134
LDI r2, 91
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
