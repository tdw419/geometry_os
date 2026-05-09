; DESCRIPTION: Places a red 98x40 rectangle at position (409, 5).
; PLAN: r0=409(x), r1=5(y), r2=98(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 5
LDI r2, 98
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
