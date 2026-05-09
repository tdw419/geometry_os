; DESCRIPTION: Places a green 71x80 rectangle at position (329, 52).
; PLAN: r0=329(x), r1=52(y), r2=71(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 52
LDI r2, 71
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
