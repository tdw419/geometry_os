; DESCRIPTION: Places a green 82x40 rectangle at position (131, 101).
; PLAN: r0=131(x), r1=101(y), r2=82(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 101
LDI r2, 82
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
