; DESCRIPTION: Places a cyan 47x28 rectangle at position (164, 211).
; PLAN: r0=164(x), r1=211(y), r2=47(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 211
LDI r2, 47
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
