; DESCRIPTION: Places a green 14x36 rectangle at position (446, 140).
; PLAN: r0=446(x), r1=140(y), r2=14(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 140
LDI r2, 14
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
