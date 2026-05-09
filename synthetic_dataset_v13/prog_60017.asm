; DESCRIPTION: Places a cyan 33x57 rectangle at position (298, 9).
; PLAN: r0=298(x), r1=9(y), r2=33(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 9
LDI r2, 33
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
