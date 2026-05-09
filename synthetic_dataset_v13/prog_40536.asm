; DESCRIPTION: Places a cyan 30x87 rectangle at position (271, 127).
; PLAN: r0=271(x), r1=127(y), r2=30(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 127
LDI r2, 30
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
