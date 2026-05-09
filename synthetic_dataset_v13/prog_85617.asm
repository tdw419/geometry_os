; DESCRIPTION: Places a black 32x102 rectangle at position (241, 150).
; PLAN: r0=241(x), r1=150(y), r2=32(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 150
LDI r2, 32
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
