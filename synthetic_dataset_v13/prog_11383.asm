; DESCRIPTION: Places a cyan 29x87 rectangle at position (428, 150).
; PLAN: r0=428(x), r1=150(y), r2=29(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 150
LDI r2, 29
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
