; DESCRIPTION: Places a cyan 81x51 rectangle at position (298, 69).
; PLAN: r0=298(x), r1=69(y), r2=81(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 69
LDI r2, 81
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
