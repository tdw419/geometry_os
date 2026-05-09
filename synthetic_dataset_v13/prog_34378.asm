; DESCRIPTION: Places a green 95x66 rectangle at position (210, 100).
; PLAN: r0=210(x), r1=100(y), r2=95(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 100
LDI r2, 95
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
