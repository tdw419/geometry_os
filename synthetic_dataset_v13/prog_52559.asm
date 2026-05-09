; DESCRIPTION: Places a cyan 50x74 rectangle at position (43, 55).
; PLAN: r0=43(x), r1=55(y), r2=50(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 55
LDI r2, 50
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
