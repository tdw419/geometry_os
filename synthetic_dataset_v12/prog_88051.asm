; DESCRIPTION: Places a black 46x48 rectangle at position (413, 105).
; PLAN: r0=413(x), r1=105(y), r2=46(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 105
LDI r2, 46
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
