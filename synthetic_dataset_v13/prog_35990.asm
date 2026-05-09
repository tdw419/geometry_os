; DESCRIPTION: Places a red 48x101 rectangle at position (216, 150).
; PLAN: r0=216(x), r1=150(y), r2=48(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 150
LDI r2, 48
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
