; DESCRIPTION: Places a cyan 75x35 rectangle at position (295, 6).
; PLAN: r0=295(x), r1=6(y), r2=75(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 6
LDI r2, 75
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
