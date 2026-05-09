; DESCRIPTION: Places a green 114x38 rectangle at position (82, 86).
; PLAN: r0=82(x), r1=86(y), r2=114(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 86
LDI r2, 114
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
