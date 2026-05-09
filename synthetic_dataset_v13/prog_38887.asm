; DESCRIPTION: Places a black 113x17 rectangle at position (210, 161).
; PLAN: r0=210(x), r1=161(y), r2=113(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 161
LDI r2, 113
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
