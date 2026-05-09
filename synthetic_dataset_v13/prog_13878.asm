; DESCRIPTION: Places a cyan 27x13 rectangle at position (35, 152).
; PLAN: r0=35(x), r1=152(y), r2=27(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 152
LDI r2, 27
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
