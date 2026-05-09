; DESCRIPTION: Places a yellow 81x19 rectangle at position (164, 117).
; PLAN: r0=164(x), r1=117(y), r2=81(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 117
LDI r2, 81
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
