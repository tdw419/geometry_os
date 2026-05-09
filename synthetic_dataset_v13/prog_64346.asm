; DESCRIPTION: Places a green 11x117 rectangle at position (346, 115).
; PLAN: r0=346(x), r1=115(y), r2=11(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 115
LDI r2, 11
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
