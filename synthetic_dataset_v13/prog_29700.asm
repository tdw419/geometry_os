; DESCRIPTION: Places a black 20x68 rectangle at position (226, 60).
; PLAN: r0=226(x), r1=60(y), r2=20(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 60
LDI r2, 20
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
