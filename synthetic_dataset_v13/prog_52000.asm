; DESCRIPTION: Places a cyan 10x74 rectangle at position (135, 108).
; PLAN: r0=135(x), r1=108(y), r2=10(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 108
LDI r2, 10
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
