; DESCRIPTION: Places a yellow 10x74 rectangle at position (171, 114).
; PLAN: r0=171(x), r1=114(y), r2=10(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 114
LDI r2, 10
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
