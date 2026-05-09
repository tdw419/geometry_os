; DESCRIPTION: Places a red 95x28 rectangle at position (13, 96).
; PLAN: r0=13(x), r1=96(y), r2=95(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 96
LDI r2, 95
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
