; DESCRIPTION: Places a white 112x91 rectangle at position (356, 163).
; PLAN: r0=356(x), r1=163(y), r2=112(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 163
LDI r2, 112
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
