; DESCRIPTION: Places a cyan 103x12 rectangle at position (65, 50).
; PLAN: r0=65(x), r1=50(y), r2=103(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 50
LDI r2, 103
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
