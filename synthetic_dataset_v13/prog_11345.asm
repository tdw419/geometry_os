; DESCRIPTION: Places a cyan 79x20 rectangle at position (123, 166).
; PLAN: r0=123(x), r1=166(y), r2=79(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 166
LDI r2, 79
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
