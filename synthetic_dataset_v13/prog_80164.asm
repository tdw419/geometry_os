; DESCRIPTION: Places a cyan 68x18 rectangle at position (373, 220).
; PLAN: r0=373(x), r1=220(y), r2=68(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 220
LDI r2, 68
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
