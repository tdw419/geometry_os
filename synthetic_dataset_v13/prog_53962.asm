; DESCRIPTION: Places a green 45x82 rectangle at position (42, 50).
; PLAN: r0=42(x), r1=50(y), r2=45(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 50
LDI r2, 45
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
