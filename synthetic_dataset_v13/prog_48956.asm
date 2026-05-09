; DESCRIPTION: Places a red 38x52 rectangle at position (24, 72).
; PLAN: r0=24(x), r1=72(y), r2=38(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 72
LDI r2, 38
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
