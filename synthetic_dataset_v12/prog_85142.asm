; DESCRIPTION: Places a white 12x42 rectangle at position (46, 163).
; PLAN: r0=46(x), r1=163(y), r2=12(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 163
LDI r2, 12
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
