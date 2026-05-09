; DESCRIPTION: Places a green 53x23 rectangle at position (405, 104).
; PLAN: r0=405(x), r1=104(y), r2=53(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 104
LDI r2, 53
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
