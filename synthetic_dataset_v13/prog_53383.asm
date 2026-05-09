; DESCRIPTION: Places a yellow 50x42 rectangle at position (63, 121).
; PLAN: r0=63(x), r1=121(y), r2=50(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 121
LDI r2, 50
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
