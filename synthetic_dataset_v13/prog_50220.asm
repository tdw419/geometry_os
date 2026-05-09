; DESCRIPTION: Places a black 72x99 rectangle at position (413, 98).
; PLAN: r0=413(x), r1=98(y), r2=72(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 98
LDI r2, 72
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
