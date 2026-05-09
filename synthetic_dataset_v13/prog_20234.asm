; DESCRIPTION: Places a red 95x27 rectangle at position (40, 24).
; PLAN: r0=40(x), r1=24(y), r2=95(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 24
LDI r2, 95
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
