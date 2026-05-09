; DESCRIPTION: Places a cyan 11x68 rectangle at position (388, 103).
; PLAN: r0=388(x), r1=103(y), r2=11(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 103
LDI r2, 11
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
