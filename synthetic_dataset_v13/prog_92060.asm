; DESCRIPTION: Places a green 103x18 rectangle at position (142, 4).
; PLAN: r0=142(x), r1=4(y), r2=103(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 4
LDI r2, 103
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
