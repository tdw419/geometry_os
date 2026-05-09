; DESCRIPTION: Places a yellow 42x117 rectangle at position (293, 74).
; PLAN: r0=293(x), r1=74(y), r2=42(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 74
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
