; DESCRIPTION: Places a green 10x94 rectangle at position (353, 91).
; PLAN: r0=353(x), r1=91(y), r2=10(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 91
LDI r2, 10
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
