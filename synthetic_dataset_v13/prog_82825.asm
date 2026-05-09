; DESCRIPTION: Places a green 44x42 rectangle at position (92, 14).
; PLAN: r0=92(x), r1=14(y), r2=44(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 14
LDI r2, 44
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
