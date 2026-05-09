; DESCRIPTION: Places a yellow 14x90 rectangle at position (151, 32).
; PLAN: r0=151(x), r1=32(y), r2=14(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 32
LDI r2, 14
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
