; DESCRIPTION: Places a green 94x11 rectangle at position (353, 187).
; PLAN: r0=353(x), r1=187(y), r2=94(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 187
LDI r2, 94
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
