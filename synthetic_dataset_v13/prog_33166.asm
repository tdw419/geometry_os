; DESCRIPTION: Places a green 112x42 rectangle at position (279, 65).
; PLAN: r0=279(x), r1=65(y), r2=112(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 65
LDI r2, 112
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
