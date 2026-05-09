; DESCRIPTION: Places a yellow 99x43 rectangle at position (18, 173).
; PLAN: r0=18(x), r1=173(y), r2=99(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 173
LDI r2, 99
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
