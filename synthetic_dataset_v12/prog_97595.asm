; DESCRIPTION: Places a red 48x34 rectangle at position (81, 8).
; PLAN: r0=81(x), r1=8(y), r2=48(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 8
LDI r2, 48
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
