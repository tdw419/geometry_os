; DESCRIPTION: Places a cyan 25x19 rectangle at position (171, 171).
; PLAN: r0=171(x), r1=171(y), r2=25(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 171
LDI r2, 25
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
