; DESCRIPTION: Places a blue 93x33 rectangle at position (284, 156).
; PLAN: r0=284(x), r1=156(y), r2=93(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 156
LDI r2, 93
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
