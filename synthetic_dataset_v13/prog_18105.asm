; DESCRIPTION: Places a black 112x20 rectangle at position (16, 52).
; PLAN: r0=16(x), r1=52(y), r2=112(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 52
LDI r2, 112
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
