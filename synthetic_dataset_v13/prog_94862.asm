; DESCRIPTION: Places a green 53x14 rectangle at position (271, 221).
; PLAN: r0=271(x), r1=221(y), r2=53(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 221
LDI r2, 53
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
