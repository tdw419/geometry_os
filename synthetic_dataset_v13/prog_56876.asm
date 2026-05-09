; DESCRIPTION: Places a red 28x95 rectangle at position (326, 54).
; PLAN: r0=326(x), r1=54(y), r2=28(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 54
LDI r2, 28
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
