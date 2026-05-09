; DESCRIPTION: Places a green 11x98 rectangle at position (46, 137).
; PLAN: r0=46(x), r1=137(y), r2=11(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 137
LDI r2, 11
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
