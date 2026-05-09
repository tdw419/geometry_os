; DESCRIPTION: Places a blue 42x112 rectangle at position (372, 91).
; PLAN: r0=372(x), r1=91(y), r2=42(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 91
LDI r2, 42
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
