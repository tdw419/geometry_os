; DESCRIPTION: Places a black 70x11 rectangle at position (235, 217).
; PLAN: r0=235(x), r1=217(y), r2=70(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 217
LDI r2, 70
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
