; DESCRIPTION: Places a green 25x76 rectangle at position (313, 168).
; PLAN: r0=313(x), r1=168(y), r2=25(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 168
LDI r2, 25
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
