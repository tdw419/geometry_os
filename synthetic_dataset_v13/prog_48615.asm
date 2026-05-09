; DESCRIPTION: Places a cyan 74x11 rectangle at position (266, 200).
; PLAN: r0=266(x), r1=200(y), r2=74(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 200
LDI r2, 74
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
