; DESCRIPTION: Places a cyan 59x101 rectangle at position (297, 92).
; PLAN: r0=297(x), r1=92(y), r2=59(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 92
LDI r2, 59
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
