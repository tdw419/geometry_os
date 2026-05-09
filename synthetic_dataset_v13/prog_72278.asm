; DESCRIPTION: Places a cyan 114x65 rectangle at position (66, 172).
; PLAN: r0=66(x), r1=172(y), r2=114(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 172
LDI r2, 114
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
