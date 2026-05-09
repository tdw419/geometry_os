; DESCRIPTION: Places a black 27x32 rectangle at position (426, 109).
; PLAN: r0=426(x), r1=109(y), r2=27(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 109
LDI r2, 27
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
