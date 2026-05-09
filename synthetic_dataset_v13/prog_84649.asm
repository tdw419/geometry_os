; DESCRIPTION: Places a cyan 103x21 rectangle at position (19, 90).
; PLAN: r0=19(x), r1=90(y), r2=103(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 90
LDI r2, 103
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
