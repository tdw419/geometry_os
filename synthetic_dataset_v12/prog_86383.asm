; DESCRIPTION: Places a cyan 18x53 rectangle at position (400, 137).
; PLAN: r0=400(x), r1=137(y), r2=18(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 137
LDI r2, 18
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
