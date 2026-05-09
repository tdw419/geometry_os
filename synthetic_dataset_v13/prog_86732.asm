; DESCRIPTION: Places a cyan 96x10 rectangle at position (295, 108).
; PLAN: r0=295(x), r1=108(y), r2=96(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 108
LDI r2, 96
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
