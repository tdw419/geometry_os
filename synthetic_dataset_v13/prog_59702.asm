; DESCRIPTION: Places a yellow 43x71 rectangle at position (424, 42).
; PLAN: r0=424(x), r1=42(y), r2=43(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 42
LDI r2, 43
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
