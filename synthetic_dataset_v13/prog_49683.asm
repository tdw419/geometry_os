; DESCRIPTION: Places a yellow 27x98 rectangle at position (318, 49).
; PLAN: r0=318(x), r1=49(y), r2=27(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 49
LDI r2, 27
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
