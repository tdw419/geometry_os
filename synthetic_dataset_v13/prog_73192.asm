; DESCRIPTION: Places a red 96x117 rectangle at position (247, 13).
; PLAN: r0=247(x), r1=13(y), r2=96(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 13
LDI r2, 96
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
