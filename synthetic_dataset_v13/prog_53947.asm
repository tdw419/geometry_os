; DESCRIPTION: Places a yellow 27x35 rectangle at position (372, 98).
; PLAN: r0=372(x), r1=98(y), r2=27(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 98
LDI r2, 27
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
