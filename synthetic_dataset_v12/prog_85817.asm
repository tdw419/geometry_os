; DESCRIPTION: Places a yellow 85x78 rectangle at position (392, 42).
; PLAN: r0=392(x), r1=42(y), r2=85(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 42
LDI r2, 85
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
