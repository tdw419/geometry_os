; DESCRIPTION: Places a red 40x48 rectangle at position (138, 34).
; PLAN: r0=138(x), r1=34(y), r2=40(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 34
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
