; DESCRIPTION: Places a cyan 61x48 rectangle at position (185, 73).
; PLAN: r0=185(x), r1=73(y), r2=61(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 73
LDI r2, 61
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
