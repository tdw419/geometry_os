; DESCRIPTION: Places a yellow 98x35 rectangle at position (43, 204).
; PLAN: r0=43(x), r1=204(y), r2=98(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 204
LDI r2, 98
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
