; DESCRIPTION: Places a black 82x55 rectangle at position (411, 187).
; PLAN: r0=411(x), r1=187(y), r2=82(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 187
LDI r2, 82
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
