; DESCRIPTION: Places a green 95x42 rectangle at position (160, 152).
; PLAN: r0=160(x), r1=152(y), r2=95(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 152
LDI r2, 95
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
