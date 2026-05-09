; DESCRIPTION: Places a cyan 16x50 rectangle at position (266, 166).
; PLAN: r0=266(x), r1=166(y), r2=16(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 166
LDI r2, 16
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
