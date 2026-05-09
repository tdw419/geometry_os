; DESCRIPTION: Places a cyan 112x25 rectangle at position (334, 38).
; PLAN: r0=334(x), r1=38(y), r2=112(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 38
LDI r2, 112
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
