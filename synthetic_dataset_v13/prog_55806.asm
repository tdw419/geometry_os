; DESCRIPTION: Places a cyan 92x112 rectangle at position (194, 8).
; PLAN: r0=194(x), r1=8(y), r2=92(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 8
LDI r2, 92
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
