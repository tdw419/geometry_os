; DESCRIPTION: Places a yellow 71x70 rectangle at position (204, 170).
; PLAN: r0=204(x), r1=170(y), r2=71(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 170
LDI r2, 71
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
