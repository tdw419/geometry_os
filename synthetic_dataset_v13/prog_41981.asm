; DESCRIPTION: Places a black 75x98 rectangle at position (280, 121).
; PLAN: r0=280(x), r1=121(y), r2=75(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 121
LDI r2, 75
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
