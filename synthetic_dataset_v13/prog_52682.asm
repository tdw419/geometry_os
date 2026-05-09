; DESCRIPTION: Places a cyan 92x96 rectangle at position (221, 32).
; PLAN: r0=221(x), r1=32(y), r2=92(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 32
LDI r2, 92
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
