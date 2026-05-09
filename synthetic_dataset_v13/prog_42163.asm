; DESCRIPTION: Places a cyan 107x98 rectangle at position (121, 124).
; PLAN: r0=121(x), r1=124(y), r2=107(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 124
LDI r2, 107
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
