; DESCRIPTION: Places a white 94x64 rectangle at position (160, 118).
; PLAN: r0=160(x), r1=118(y), r2=94(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 118
LDI r2, 94
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
