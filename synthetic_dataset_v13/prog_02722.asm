; DESCRIPTION: Places a green 10x95 rectangle at position (461, 59).
; PLAN: r0=461(x), r1=59(y), r2=10(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 59
LDI r2, 10
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
