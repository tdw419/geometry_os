; DESCRIPTION: Places a green 43x45 rectangle at position (295, 133).
; PLAN: r0=295(x), r1=133(y), r2=43(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 133
LDI r2, 43
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
