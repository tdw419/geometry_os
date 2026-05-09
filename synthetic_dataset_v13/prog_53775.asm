; DESCRIPTION: Places a cyan 12x50 rectangle at position (270, 173).
; PLAN: r0=270(x), r1=173(y), r2=12(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 173
LDI r2, 12
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
