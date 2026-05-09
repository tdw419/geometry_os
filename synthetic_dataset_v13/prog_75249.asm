; DESCRIPTION: Places a yellow 33x74 rectangle at position (56, 56).
; PLAN: r0=56(x), r1=56(y), r2=33(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 56
LDI r2, 33
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
