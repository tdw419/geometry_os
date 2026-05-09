; DESCRIPTION: Places a cyan 51x67 rectangle at position (223, 175).
; PLAN: r0=223(x), r1=175(y), r2=51(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 175
LDI r2, 51
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
