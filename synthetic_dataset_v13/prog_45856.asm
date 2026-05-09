; DESCRIPTION: Places a cyan 57x71 rectangle at position (163, 7).
; PLAN: r0=163(x), r1=7(y), r2=57(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 7
LDI r2, 57
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
