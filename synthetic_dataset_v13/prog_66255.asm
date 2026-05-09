; DESCRIPTION: Places a cyan 13x55 rectangle at position (123, 123).
; PLAN: r0=123(x), r1=123(y), r2=13(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 123
LDI r2, 13
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
