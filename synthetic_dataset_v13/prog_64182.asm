; DESCRIPTION: Places a black 56x59 rectangle at position (228, 100).
; PLAN: r0=228(x), r1=100(y), r2=56(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 100
LDI r2, 56
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
