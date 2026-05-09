; DESCRIPTION: Places a yellow 52x95 rectangle at position (426, 27).
; PLAN: r0=426(x), r1=27(y), r2=52(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 27
LDI r2, 52
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
