; DESCRIPTION: Places a white 65x60 rectangle at position (196, 163).
; PLAN: r0=196(x), r1=163(y), r2=65(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 163
LDI r2, 65
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
