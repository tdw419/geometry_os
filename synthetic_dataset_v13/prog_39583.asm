; DESCRIPTION: Places a red 89x30 rectangle at position (33, 164).
; PLAN: r0=33(x), r1=164(y), r2=89(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 164
LDI r2, 89
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
