; DESCRIPTION: Places a cyan 55x114 rectangle at position (387, 140).
; PLAN: r0=387(x), r1=140(y), r2=55(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 140
LDI r2, 55
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
