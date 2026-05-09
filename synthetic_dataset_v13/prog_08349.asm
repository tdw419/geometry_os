; DESCRIPTION: Places a yellow 103x117 rectangle at position (60, 71).
; PLAN: r0=60(x), r1=71(y), r2=103(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 71
LDI r2, 103
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
