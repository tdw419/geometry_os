; DESCRIPTION: Places a white 28x58 rectangle at position (111, 163).
; PLAN: r0=111(x), r1=163(y), r2=28(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 163
LDI r2, 28
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
