; DESCRIPTION: Places a cyan 59x57 rectangle at position (0, 112).
; PLAN: r0=0(x), r1=112(y), r2=59(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 112
LDI r2, 59
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
