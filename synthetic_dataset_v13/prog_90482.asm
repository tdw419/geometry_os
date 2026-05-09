; DESCRIPTION: Places a blue 103x86 rectangle at position (133, 33).
; PLAN: r0=133(x), r1=33(y), r2=103(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 33
LDI r2, 103
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
