; DESCRIPTION: Places a black 16x18 rectangle at position (21, 33).
; PLAN: r0=21(x), r1=33(y), r2=16(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 33
LDI r2, 16
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
