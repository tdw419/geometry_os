; DESCRIPTION: Places a white 64x10 rectangle at position (238, 221).
; PLAN: r0=238(x), r1=221(y), r2=64(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 221
LDI r2, 64
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
