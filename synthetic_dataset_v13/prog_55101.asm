; DESCRIPTION: Places a green 98x44 rectangle at position (259, 91).
; PLAN: r0=259(x), r1=91(y), r2=98(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 91
LDI r2, 98
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
