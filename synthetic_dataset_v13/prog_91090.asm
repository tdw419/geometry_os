; DESCRIPTION: Places a yellow 54x98 rectangle at position (324, 103).
; PLAN: r0=324(x), r1=103(y), r2=54(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 103
LDI r2, 54
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
