; DESCRIPTION: Places a green 108x73 rectangle at position (386, 19).
; PLAN: r0=386(x), r1=19(y), r2=108(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 19
LDI r2, 108
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
