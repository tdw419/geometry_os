; DESCRIPTION: Places a cyan 92x71 rectangle at position (315, 53).
; PLAN: r0=315(x), r1=53(y), r2=92(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 53
LDI r2, 92
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
