; DESCRIPTION: Places a white 10x11 rectangle at position (144, 163).
; PLAN: r0=144(x), r1=163(y), r2=10(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 163
LDI r2, 10
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
