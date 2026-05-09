; DESCRIPTION: Places a green 67x63 rectangle at position (417, 164).
; PLAN: r0=417(x), r1=164(y), r2=67(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 164
LDI r2, 67
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
