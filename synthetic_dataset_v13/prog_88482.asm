; DESCRIPTION: Places a yellow 27x15 rectangle at position (484, 142).
; PLAN: r0=484(x), r1=142(y), r2=27(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 142
LDI r2, 27
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
