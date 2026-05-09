; DESCRIPTION: Places a cyan 81x102 rectangle at position (298, 23).
; PLAN: r0=298(x), r1=23(y), r2=81(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 23
LDI r2, 81
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
