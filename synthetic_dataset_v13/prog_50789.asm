; DESCRIPTION: Places a cyan 69x51 rectangle at position (370, 191).
; PLAN: r0=370(x), r1=191(y), r2=69(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 191
LDI r2, 69
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
