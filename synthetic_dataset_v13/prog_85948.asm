; DESCRIPTION: Places a black 24x74 rectangle at position (164, 59).
; PLAN: r0=164(x), r1=59(y), r2=24(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 59
LDI r2, 24
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
