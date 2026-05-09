; DESCRIPTION: Places a yellow 71x19 rectangle at position (204, 87).
; PLAN: r0=204(x), r1=87(y), r2=71(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 87
LDI r2, 71
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
