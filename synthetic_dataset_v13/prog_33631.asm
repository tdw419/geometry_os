; DESCRIPTION: Places a orange 98x100 rectangle at position (73, 32).
; PLAN: r0=73(x), r1=32(y), r2=98(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 32
LDI r2, 98
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
