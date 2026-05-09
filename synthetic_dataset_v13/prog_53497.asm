; DESCRIPTION: Places a green 69x105 rectangle at position (422, 91).
; PLAN: r0=422(x), r1=91(y), r2=69(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 91
LDI r2, 69
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
