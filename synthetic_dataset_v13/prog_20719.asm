; DESCRIPTION: Places a cyan 51x84 rectangle at position (170, 103).
; PLAN: r0=170(x), r1=103(y), r2=51(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 103
LDI r2, 51
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
