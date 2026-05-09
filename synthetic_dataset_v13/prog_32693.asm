; DESCRIPTION: Places a red 65x42 rectangle at position (130, 0).
; PLAN: r0=130(x), r1=0(y), r2=65(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 0
LDI r2, 65
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
