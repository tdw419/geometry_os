; DESCRIPTION: Places a cyan 96x70 rectangle at position (289, 103).
; PLAN: r0=289(x), r1=103(y), r2=96(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 103
LDI r2, 96
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
