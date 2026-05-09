; DESCRIPTION: Places a yellow 14x19 rectangle at position (458, 84).
; PLAN: r0=458(x), r1=84(y), r2=14(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 84
LDI r2, 14
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
