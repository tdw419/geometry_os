; DESCRIPTION: Places a green 92x57 rectangle at position (420, 96).
; PLAN: r0=420(x), r1=96(y), r2=92(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 96
LDI r2, 92
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
