; DESCRIPTION: Places a red 84x38 rectangle at position (111, 22).
; PLAN: r0=111(x), r1=22(y), r2=84(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 22
LDI r2, 84
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
