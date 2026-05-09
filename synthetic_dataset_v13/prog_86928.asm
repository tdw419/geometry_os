; DESCRIPTION: Places a red 94x83 rectangle at position (164, 20).
; PLAN: r0=164(x), r1=20(y), r2=94(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 20
LDI r2, 94
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
