; DESCRIPTION: Places a orange 72x24 rectangle at position (196, 64).
; PLAN: r0=196(x), r1=64(y), r2=72(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 64
LDI r2, 72
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
