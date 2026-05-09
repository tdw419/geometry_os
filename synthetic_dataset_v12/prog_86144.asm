; DESCRIPTION: Places a cyan 51x82 rectangle at position (393, 155).
; PLAN: r0=393(x), r1=155(y), r2=51(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 155
LDI r2, 51
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
