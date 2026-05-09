; DESCRIPTION: Places a green 48x95 rectangle at position (8, 118).
; PLAN: r0=8(x), r1=118(y), r2=48(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 118
LDI r2, 48
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
