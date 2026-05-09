; DESCRIPTION: Places a cyan 116x57 rectangle at position (321, 132).
; PLAN: r0=321(x), r1=132(y), r2=116(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 132
LDI r2, 116
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
