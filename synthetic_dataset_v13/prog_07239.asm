; DESCRIPTION: Places a cyan 68x79 rectangle at position (21, 12).
; PLAN: r0=21(x), r1=12(y), r2=68(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 12
LDI r2, 68
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
