; DESCRIPTION: Places a cyan 38x79 rectangle at position (289, 114).
; PLAN: r0=289(x), r1=114(y), r2=38(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 114
LDI r2, 38
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
