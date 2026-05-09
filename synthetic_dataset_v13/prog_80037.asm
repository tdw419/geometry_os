; DESCRIPTION: Places a yellow 27x98 rectangle at position (39, 2).
; PLAN: r0=39(x), r1=2(y), r2=27(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 2
LDI r2, 27
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
