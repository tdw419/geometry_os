; DESCRIPTION: Places a green 91x61 rectangle at position (324, 98).
; PLAN: r0=324(x), r1=98(y), r2=91(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 98
LDI r2, 91
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
