; DESCRIPTION: Places a cyan 66x94 rectangle at position (400, 28).
; PLAN: r0=400(x), r1=28(y), r2=66(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 28
LDI r2, 66
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
