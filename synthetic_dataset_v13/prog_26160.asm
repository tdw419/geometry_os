; DESCRIPTION: Places a green 66x87 rectangle at position (380, 87).
; PLAN: r0=380(x), r1=87(y), r2=66(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 87
LDI r2, 66
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
